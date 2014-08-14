import vialab.SMT.*;
import android.util.Log;

void setup(){
	SMT.init( this);
	//SMT.dlog( "Hallo :)\n");
	SMT.add( new Zone( "Asdf", 220, 10, 100, 100));
}

void draw(){
	background( 25);
	noStroke();
	fill( 200, 120, 120, 180);
	rect( 10, 10, 100, 100);
}


//drawing options
public String sketchRenderer(){
	return SMT.RENDERER;}
public int sketchWidth(){
	return displayWidth;}
public int sketchHeight(){
	return displayHeight;}
