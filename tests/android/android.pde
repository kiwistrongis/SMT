import vialab.SMT.*;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;

//drawing options
public String sketchRenderer(){
	return SMT.RENDERER;}
public int sketchWidth(){
	return displayWidth;}
public int sketchHeight(){
	return displayHeight;}

//variables
AndroidTouchTracker everything_listener;
//int sketch_orientation = LANDSCAPE;
int sketch_orientation = PORTRAIT;

void setup(){
	orientation( sketch_orientation);
	SMT.init( this);
	//SMT.dlog( "Hallo :)\n");
	SMT.add( new Zone( "Asdf", 220, 10, 100, 100));
	
	//other
	everything_listener = new AndroidTouchTracker();
	View sketch_view = this.surfaceView;
	sketch_view.setOnTouchListener( everything_listener);
}

void draw(){
	background( 25);
	drawFrameRate();
	drawTouchCount();
	drawTouchInfo();
}
void drawAsdf( Zone zone){
	noStroke();
	fill( 200, 120, 120, 180);
	rect( 10, 10, 100, 100);
}

//drawing methods
public void drawFrameRate(){
	float fps = this.frameRate;
	String fps_text = String.format( "fps: %.0f", fps);
	pushStyle();
	fill( 240, 240, 240, 180);
	textAlign( LEFT, TOP);
	textSize( 32);
	text( fps_text, 10, 10);
	popStyle();
}
public void drawTouchCount(){
	int count = SMT.getTouchCount();
	String count_text = String.valueOf( count);
	pushStyle();
	fill( 240, 240, 240, 180);
	textAlign( CENTER, CENTER);
	textMode( SHAPE);
	textSize( 200);
	text( count_text, displayWidth / 2, displayHeight / 2);
	popStyle();
}
public void drawTouchInfo(){
	for( vialab.SMT.Touch touch : SMT.getTouches()){
		String touch_text = String.format(
			"id: %d\n" +
				"port: %d\n" +
				"source: %s\n" +
				"raw: %.2f, %.2f\n" +
				"fitted: %.2f, %.2f\n" +
				"rounded: %d, %d",
			touch.cursorID, touch.sessionID >> 48,
			touch.getTouchSource(),
			touch.getRawX(), touch.getRawY(),
			touch.getX(), touch.getY(),
			touch.x, touch.y);
		
		pushStyle();
		noFill();
		stroke( 240, 240, 240, 180);
		strokeWeight( 8);
		ellipse( touch.getX(), touch.getY(), 50, 50);
		fill( 240, 240, 240, 180);
		textAlign( LEFT, TOP);
		textSize( 30);
		text( touch_text, touch.x + 50, touch.y - 20);
		popStyle();
	}
}

private static class AndroidTouchTracker implements View.OnTouchListener {
	public AndroidTouchTracker(){}
	@Override
	public boolean onTouch( View view, MotionEvent event){
		int action = event.getActionMasked();
		int action_index = event.getActionIndex();
		int pointer_id = event.getPointerId( action_index);
		int pointer_count = event.getPointerCount();
		float x = event.getX();
		float y = event.getY();
		float x_raw = event.getRawX();
		float y_raw = event.getRawY();

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
				action_string = "unrecognized";
				break;}

		String message = "touches";
		for( int index = 0; index < pointer_count; index++)
			message += String.format(
				"\n\tindex: %d, id: %d, pos: %f, %f",
				index, event.getPointerId( index),
				event.getX( index), event.getY( index));
		SMT.dlog( message);

		return false;
	}
}










