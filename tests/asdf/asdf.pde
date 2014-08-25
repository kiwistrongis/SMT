import vialab.SMT.awt.Dimension;
import vialab.SMT.*;

Zone asdf;

void setup(){
	size( 800, 600, SMT.RENDERER);
	SMT.init( this);

	asdf = new Zone( "Asdf", 10, 10, 100, 100);
	SMT.add( asdf);
}

void draw(){
	background( 20);
}

void drawAsdf( Zone zone){
	noStroke();
	fill( 200, 120, 120, 180);
	rect( 0, 0, zone.width, zone.height);
}
void pickDrawAsdf( Zone zone){
	rect( 0, 0, zone.width, zone.height);
}
void touchAsdf( Zone zone){
	zone.rst();
}
void touchUpAsdf( Zone zone, Touch touch){
	float max_scale = 2.0f;
	Dimension base_size = zone.getSize();
	Dimension screen_size = zone.getScreenSize();
	//( assuming the width and height are scaled identically )
	float current_scale = (float) screen_size.width / base_size.width;
	//if the zone has exceeded the desired max scale,
	if( current_scale > max_scale){
		//make it 'bounce back' to the desired scale
		PVector old_pos = zone.getOrigin();
		zone.translate( old_pos.x, old_pos.y);
		zone.resetMatrix();
		zone.scale( max_scale);
	}
}
