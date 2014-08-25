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
AndroidTouchListener everything_listener;
int sketch_orientation = LANDSCAPE;

void setup(){
	orientation( sketch_orientation);
	SMT.init( this);
	//SMT.dlog( "Hallo :)\n");
	SMT.add( new Zone( "Asdf", 220, 10, 100, 100));
	
	//other
	everything_listener = new AndroidTouchListener();
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
		textAlign(LEFT, TOP);
		textSize( 30);
		text( touch_text, touch.x + 50, touch.y - 20);
		popStyle();
	}
}

private static class AndroidTouchListener implements View.OnTouchListener {
	public AndroidTouchListener(){}
	@Override
	public boolean onTouch( View view, MotionEvent event){
		int action = event.getAction();
		int action_index = event.getActionIndex();
		int pointer_id = event.getPointerId( action_index);
		int pointer_count = event.getPointerCount();
		int x = event.getX();
		int y = event.getY();
		int x_raw = event.getRawX();
		int y_raw = event.getRawY();

		SMT.dlog(
			"touch:\n\tindex: %d / %d\n" +
			"\tid: %d action: %x\n" +
			"\tposition: %f, %f raw: %f, %f",
			action_index, pointer_count,
			pointer_id, action,
			x, y, x_raw, y_raw);

		return false;
	}
}


/*int ACTION_CANCEL
int	ACTION_DOWN
int	ACTION_MASK
int	ACTION_MOVE
int	ACTION_POINTER_DOWN
int	ACTION_POINTER_INDEX_MASK
int	ACTION_POINTER_INDEX_SHIFT
int	ACTION_POINTER_UP
int	ACTION_UP*/