package vialab.SMT.util;

//standard library imports
//import java.awt.Rectangle;

//processing imports
import processing.core.*;

//smt imports
import vialab.SMT.*;

/**
 * A class that maps touch coordinates the current sketch's dimensions.
 **/
public class SketchTouchBinder extends TouchBinder {

	//fields
	private PApplet applet;

	//contructors
	/**
	 * Create a new sketch touch binder that maps to the current sketch's dimensions.
	 */
	public SketchTouchBinder( PApplet applet){
		super();
		this.applet = applet;
		//create bind matrix
		PMatrix2D bind_matrix = new PMatrix2D();
		bind_matrix.scale( applet.width, applet.height);
		//set bind matrix and clamp bounds
		this.setBindMatrix( bind_matrix);
		this.setClampMax( new PVector(
			applet.width, applet.height));
	}
}