package vialab.SMT;

//standard library imports
import java.lang.reflect.Method;
import java.util.*;

//android imports
import android.view.MotionEvent;

//processing imports
import processing.core.PApplet;
import processing.core.PGraphics;

//local imports
import vialab.SMT.util.*;

class SMTTouchManager {
	private PApplet applet;
	private AndroidTouchListener listener;
	private ZonePicker picker;
	private Method touchDown, touchMoved, touchUp;
	private HashMap<Touch, Zone> touchPrevZone;
	private HashMap<Integer, Touch> touches;
	private Vector<Touch> touches_new;
	private Vector<Touch> touches_moved;
	private Vector<Touch> touches_dead;
	private boolean debug = false;

	public SMTTouchManager( AndroidTouchListener listener, ZonePicker picker){
		this.listener = listener;
		this.picker = picker;
		this.applet = SMT.applet;
		retrieveMethods( SMT.applet);
		touchPrevZone = new HashMap<Touch, Zone>();
		touches = new HashMap<Integer, Touch>();
		touches_new = new Vector<Touch>();
		touches_moved = new Vector<Touch>();
		touches_dead = new Vector<Touch>();
	}

	/**
	 * Determines to which objects touch events should be sent, and then sends them.
	 */
	public void handleTouches(){
		//render pick buffer
		picker.render();
		//update touch timestamps
		for( Touch touch : touches.values())
			touch.updateTime();
		//parse through events so far
		parseListenerQueue();
		//work through the various touch queues
		//handleTouchesUp();
		//handleTouchesMoved();
		//handleTouchesDown();
		touches_new.clear();
		touches_moved.clear();
		touches_dead.clear();
	}

	protected void parseListenerQueue(){
		while( ! listener.event_queue.isEmpty()){
			//get next event to parse
			MotionEvent event = listener.event_queue.remove( 0);
			int action_index = event.getActionIndex();
			int action_id = event.getPointerId( action_index);
			int pointer_count = event.getPointerCount();
			long action_time = event.getEventTime();
			Touch action_touch = touches.get( action_id);

			//update each pointer's position
			for( int index = 0; index < event.getPointerCount(); index++){
				//get pointer data
				int id = event.getPointerId( index);
				float x = event.getX( index);
				float y = event.getY( index);
				//get touch and update it
				Touch touch = touches.get( id);
				if( touch != null)
					touch.update( x, y, action_time);
			}

			//handle up/down events
			switch( event.getActionMasked()){
				case MotionEvent.ACTION_DOWN:
				case MotionEvent.ACTION_POINTER_DOWN:
					if( debug) SMT.dlog(
						"manager:: touch down: id: %d, index: %d",
						action_id, action_index);
					Touch new_touch = new Touch(
						action_id, event.getX( action_index),
						event.getY( action_index), action_time);
					touches.put( action_id, new_touch); 
					touches_new.add( new_touch); 
					break;
				case MotionEvent.ACTION_POINTER_UP:
					if( debug) SMT.dlog(
						"manager:: touch up: id: %d, index: %d",
						action_id, action_index);
					touches.remove( action_id);
					touches_dead.add( action_touch);
					break;
				case MotionEvent.ACTION_UP:
				case MotionEvent.ACTION_CANCEL:
					if( debug) SMT.dlog( "manager:: all touches died");
					for( Touch touch : touches.values())
						touches_dead.add( touch);
					touches.clear();
					break;
				case MotionEvent.ACTION_MOVE: //handled above
					if( debug) SMT.dlog( "manager:: touches moved");
					break;
				default: break;
			}
		}
	}
	
	protected void handleTouchesDown(){
		for( Touch touch : touches_new){
			SMTUtilities.invoke( touchDown, applet, null, touch);
			Zone zone = pick( touch);
			touchPrevZone.put( touch, zone);
			doTouchDown( zone, touch);
			touch.invokeTouchDownEvent();
		}
		touches_new.clear();
	}
	protected void handleTouchesUp(){
		for( Touch touch : touches_dead){
			// the touch existed, but no longer exists, so it went up
			SMTUtilities.invoke( touchUp, applet, null, touch);
			for ( Zone zone : touch.getAssignedZones()){
				doTouchUp( zone, touch);
				if ( touchPrevZone.get( touch) == zone)
					doPress( zone, touch);
			}
			touchPrevZone.remove( touch);
			touch.invokeTouchUpEvent();
		}
		touches_dead.clear();
	}
	protected void handleTouchesMoved(){
		for( Touch touch : touches_moved){
			SMTUtilities.invoke( touchMoved, applet, null, touch);
			Zone zone = null;
			if( ! touch.isAssigned()){
				zone = pick( touch);
				// Assign the touch to the picked Zone, as long as the touch is not grabbed
				if ( zone != null)
					zone.assign( touch);
			}
			else {
				boolean first = true;
				for( Zone assigned_zone : touch.getAssignedZones())
					if( ! assigned_zone.getCaptureTouches()){
						//if the zone defines a press method, make sure to unassign when we no longer pick to the Zone, meaning that the touchUp can rely on the previous pick of the Touch to determine if the zone was pressed
						if ( first){
							zone = pick( touch);
							first = false;
						}
						if ( zone != assigned_zone){
							assigned_zone.unassign( touch);
							// Assign the touch to the picked Zone
							if ( zone != null)
								zone.assign( touch);
						}
					}
			}
			for( Zone assigned_zone : touch.getAssignedZones())
				doTouchMoved( assigned_zone, touch);
			touchPrevZone.put( touch, zone);
			touch.invokeTouchMovedEvent();
		}
		touches_moved.clear();
	}

	private void doPress( Zone zone, Touch touch){
		if ( zone != null)
			zone.pressRegister( touch);
	}

	/**
	 * Called when a touch went down, or when an orphaned touch moves around.
	 * @param zone may be null
	 */
	private void doTouchDown( Zone zone, Touch touch){
		if ( zone != null){
			zone.assign( touch);
			zone.touchDownRegister( touch);
		}
	}

	/**
	 * Called when a touch went up.
	 * @param zone may be null
	 */
	private void doTouchUp( Zone zone, Touch touch){
		if ( zone != null){
			zone.unassign( touch);
			zone.touchUpRegister( touch);
		}
	}

	private void doTouchMoved( Zone zone, Touch touch){
		if ( zone != null)
			zone.touchMovedRegister( touch);
	}

	private Zone pick( Touch touch){
		return picker.pick( touch.x, touch.y);
	}

	private void retrieveMethods( PApplet applet){
		touchDown = SMTUtilities.getAnyPMethod(
			applet, "touch", "Down", true, Touch.class);
		touchMoved = SMTUtilities.getAnyPMethod(
			applet, "touch", "Moved", true, Touch.class);
		touchUp = SMTUtilities.getAnyPMethod(
			applet, "touch", "Up", true, Touch.class);
		SMTUtilities.methodSet.add( "touchDown");
		SMTUtilities.methodSet.add( "touchMoved");
		SMTUtilities.methodSet.add( "touchUp");
	}

	public Collection<Touch> getTouches(){
		return touches.values();
	}
}
