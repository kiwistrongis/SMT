package vialab.SMT.util;

//standard library imports
import java.util.*;

//android imports
import android.view.MotionEvent;
import android.view.View;

//local imports
import vialab.SMT.*;

public class AndroidTouchListener implements View.OnTouchListener {
	//fields
	public Vector<MotionEvent> event_queue;
	public boolean debug = true;

	//constructor
	public AndroidTouchListener(){
		event_queue = new Vector<MotionEvent>();
	}

	//android touch event handle
	@Override
	public boolean onTouch( View view, MotionEvent event){
		event_queue.add( MotionEvent.obtain( event));

		if( debug){
			int action = event.getActionMasked();
			int action_index = event.getActionIndex();
			int action_id = event.getPointerId( action_index);
			int pointer_count = event.getPointerCount();
			float x = event.getX( action_index);
			float y = event.getY( action_index);
			long time = event.getEventTime();

			String action_string;
			switch( action){
				case MotionEvent.ACTION_CANCEL:
					action_string = "action_cancel";
					break;
				case MotionEvent.ACTION_DOWN:
					action_string = "action_down";
					break;
				case MotionEvent.ACTION_MOVE:
					action_string = "action_move";
					break;
				case MotionEvent.ACTION_POINTER_DOWN:
					action_string = "action_pointer_down";
					break;
				case MotionEvent.ACTION_POINTER_UP:
					action_string = "action_pointer_up";
					break;
				case MotionEvent.ACTION_UP:
					action_string = "action_up";
					break;
				default:
					action_string = "unknown";
					break;
			}

			String message = String.format(
				"listener:: touch event: %s %d %d",
				action_string, action_index, action_id);
			for( int i = 0; i < pointer_count; i++)
				message += String.format(
					"\n\tid: %d, pos: %07.2f, %07.2f",
					event.getPointerId( i), event.getX( i), event.getY( i));

			SMT.dlog( message);
		}

		return true;
	}


}
