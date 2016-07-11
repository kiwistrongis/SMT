/**
 * Sketch for Basics Tutorial 1
 */

import vialab.SMT.*;

//Settings function for the applet
void settings(){
	// choose the window size and renderer
	size( 1400, 800, SMT.RENDERER);
}

//Setup function for the applet
void setup(){
	//SMT and Processing setup
	SMT.init( this, TouchSource.AUTOMATIC);

	//Make a new Zone
	Zone zone = new Zone( "MyZone");
	SMT.add( zone);
}

//Draw function for the sketch
void draw(){
	background( 30);
}

//Draw function for "MyZone"
void drawMyZone( Zone zone){
	fill( #88dd88);
	rect( 0, 0, 100, 100);
}

void pickDrawMyZone( Zone zone){
	rect( 0, 0, 100, 100);
}
//Touch function for "MyZone"
void touchMyZone( Zone zone){
	zone.rst();
}
