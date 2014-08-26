import vialab.SMT.*;
import android.view.MotionEvent;
import android.view.View;

//drawing options
public String sketchRenderer(){
	return SMT.RENDERER;}
public int sketchWidth(){
	return displayWidth;}
public int sketchHeight(){
	return displayHeight;}

//variables
//int sketch_orientation = LANDSCAPE;
int sketch_orientation = PORTRAIT;

void setup(){
	orientation( sketch_orientation);
	SMT.init( this);

	SMT.add( new Zone( "Asdf", 220, 10, 100, 100));
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
				"source: %s\n" +
				"raw: %.2f, %.2f\n" +
				"fitted: %.2f, %.2f\n" +
				"rounded: %d, %d",
			touch.cursorID,
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
