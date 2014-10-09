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
int sketch_orientation = LANDSCAPE;
//int sketch_orientation = PORTRAIT;
boolean draw_touchtext = false;

//zones
Zone frame;
ViewportZone viewport;
Zone blue, red, purple, green;

void setup(){
	orientation( sketch_orientation);
	SMT.init( this);

	SMT.dlog( "hello :)");
	SMT.add( new Zone( "Asdf", 220, 10, 100, 100));
	//create zones
	frame = new Zone( "Frame", 50, 50, 440, 440);
	viewport = new ViewportZone( 20, 20, 400, 400);
	blue = new Zone( "Blue", 10, 50, 100, 100);
	red = new Zone( "Red", 50, 10, 100, 100);
	purple = new Zone( "Purple", 150, 300, 100, 100);
	green = new Zone( "Green", 300, 150, 100, 100);
	//set up zone structure
	SMT.add( purple);
	SMT.add( green);
	//SMT.add( frame);
	//frame.add( viewport);
	//viewport.add( blue);
	//viewport.add( red);
}

void pre(){
	SMT.dlog( "test");
}
void draw(){
	background( 25);
	drawFrameRate();
	drawTouchCount();
	drawTouchInfo();
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
				"fitted: %.2f, %.2f\n" +
				"rounded: %d, %d",
			touch.id,
			touch.getX(), touch.getY(),
			touch.x, touch.y);
		
		pushStyle();
		noFill();
		stroke( 240, 240, 240, 180);
		strokeWeight( 8);
		ellipse( touch.getX(), touch.getY(), 50, 50);
		if( draw_touchtext){
			fill( 240, 240, 240, 180);
			textAlign( LEFT, TOP);
			textSize( 30);
			text( touch_text, touch.x + 50, touch.y - 20);
		}
		popStyle();
	}
}

//zone functions
void drawAsdf( Zone zone){
	noStroke();
	fill( 200, 120, 120, 180);
	rect( 10, 10, 100, 100);
}

//methods for the "frame" zone
void drawFrame( Zone zone){
	pushMatrix();
	pushStyle();
	fill( 30, 30, 30, 180);
	stroke( 240, 240, 240, 220);
	strokeWeight( 5);
	rect( 0, 0, zone.width + 00, zone.height + 00, 0);
	popStyle();
	popMatrix();
}
void touchFrame( Zone zone){
	zone.rst();
}
void touchUpFrame( Zone zone, Touch touch){
	viewport.refresh();
}

//methods for viewport zone
void drawViewportZone( Zone zone){
	background( 40, 70, 70, 180);
}
void touchViewportZone( Zone zone){
	zone.pinch();
}

//methods for the "blue" zone
void drawBlue( Zone zone){
	pushStyle();
	noStroke();
	fill( 110, 140, 180, 230);
	rect( 0, 0, zone.width, zone.height, 0);
	popStyle();
}
void touchBlue( Zone zone){
	zone.rst();
}

//methods for the "red" zone
void drawRed( Zone zone){
	pushStyle();
	noStroke();
	fill( 180, 120, 110, 230);
	rect( 0, 0, zone.width, zone.height, 0);
	popStyle();
}
void touchRed( Zone zone){
	zone.rst();
}


//methods for the "purple" zone
void drawPurple( Zone zone){
	pushStyle();
	noStroke();
	fill( 150, 110, 150, 230);
	rect( 0, 0, zone.width, zone.height, 0);
	popStyle();
}
void touchPurple( Zone zone){
	zone.rst();
}


//methods for the "green" zone
void drawGreen( Zone zone){
	pushStyle();
	noStroke();
	fill( 120, 180, 110, 230);
	rect( 0, 0, zone.width, zone.height, 0);
	popStyle();
}
void touchGreen( Zone zone){
	zone.rst();
}
