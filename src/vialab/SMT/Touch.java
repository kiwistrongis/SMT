package vialab.SMT;

import java.util.Vector;

import processing.core.PApplet;
import TUIO.*;

/**
 * Extending TuioCursor to rename it Touch
 * 
 */
public class Touch extends TuioCursor {

	/** Processing PApplet */
	static PApplet applet = TouchClient.parent;
	/** The individual cursor ID number that is assigned to each TuioCursor. */
	public int cursorId;
	/** Reflects the current state of the TuioComponent. */
	public int state;
	/**
	 * The unique session ID number that is assigned to each TUIO object or
	 * cursor.
	 */
	public long sessionID;
	/** The X coordinate in pixels relative to the PApplet screen width. */
	public int x;
	/** The Y coordinate in pixels relative to the PApplet screen height. */
	public int y;
	/** The X-axis velocity value. */
	public float xSpeed;
	/** The Y-axis velocity value. */
	public float ySpeed;
	/** The motion speed value. */
	public float motionSpeed;
	/** The motion acceleration value. */
	public float motionAcceleration;

	public TuioTime startTime, currentTime;
	/**
	 * A Vector of TuioPoints containing all the previous positions of the TUIO
	 * component.
	 */
	public Vector<TuioPoint> path;

	/**
	 * This constructor takes the attributes of the provided TuioCursor and
	 * assigns these values to the newly created Touch.
	 * 
	 * @param t
	 *            - TuioCursor
	 */
	public Touch(TuioCursor t) {
		super(t);
		this.updateTouch(t);
	}

	/**
	 * This constructor takes the provided Session ID, Cursor ID, X and Y
	 * coordinate and assigns these values to the newly created Touch.
	 * 
	 * @param si
	 *            - Session ID
	 * @param ci
	 *            - Cursor ID
	 * @param xp
	 *            - X Coordinate
	 * @param yp
	 *            - Y Coordinate
	 */
	public Touch(long si, int ci, float xp, float yp) {
		super(si, ci, xp, yp);
		cursorId = getCursorID();
		x = getScreenX(applet.width);
		y = getScreenY(applet.height);
		startTime = getStartTime();
		currentTime = getTuioTime();
		xSpeed = getXSpeed();
		ySpeed = getYSpeed();
		motionSpeed = getMotionSpeed();
		motionAcceleration = getMotionAccel();
		path = getPath();
		sessionID = getSessionID();
		state = getTuioState();
	}

	/**
	 * This constructor takes a TuioTime argument and assigns it along with the
	 * provided Session ID, Cursor ID, X and Y coordinate to the newly created
	 * Touch.
	 * 
	 * @param ttime
	 *            - TuioTime
	 * @param si
	 *            - Session ID
	 * @param ci
	 *            - Cursor ID
	 * @param xp
	 *            - X Coordinate
	 * @param yp
	 *            - Y Coordinate
	 */
	public Touch(TuioTime ttime, long si, int ci, float xp, float yp) {
		super(ttime, si, ci, xp, yp);
		cursorId = getCursorID();
		x = getScreenX(applet.width);
		y = getScreenY(applet.height);
		startTime = getStartTime();
		currentTime = getTuioTime();
		xSpeed = getXSpeed();
		ySpeed = getYSpeed();
		motionSpeed = getMotionSpeed();
		motionAcceleration = getMotionAccel();
		path = getPath();
		sessionID = getSessionID();
		state = getTuioState();
	}

	/**
	 * Get the screen-relative x coordinate
	 * 
	 * @param width
	 *            the screen width in pixels
	 * @return the coordinate of the x position of the touch from 0 to width
	 */
	@Override
	public int getScreenX(int width) {
		return super.getScreenX(width);
	}

	/**
	 * Get the screen-relative y coordinate
	 * 
	 * @param height
	 *            the screen height in pixels
	 * @return the coordinate of the y position of the touch from 0 to height
	 */
	@Override
	public int getScreenY(int height) {
		return super.getScreenY(height);
	}

	public TuioPoint getLastPoint() {
		Vector<TuioPoint> path = getPath();
		if (path.size() <= 1) {
			return null;
		}

		return path.get(path.size() - 2);
	}
	
	public void updateTouch(TuioCursor t){
		cursorId = t.getCursorID();
		x = t.getScreenX(applet.width);
		y = t.getScreenY(applet.height);

		super.startTime = t.getStartTime();
		startTime = t.getStartTime();

		super.currentTime = t.getTuioTime();
		currentTime = t.getTuioTime();

		super.x_speed = t.getXSpeed();
		xSpeed = t.getXSpeed();

		super.y_speed = t.getYSpeed();
		ySpeed = t.getYSpeed();

		super.motion_speed = t.getMotionSpeed();
		motionSpeed = t.getMotionSpeed();

		super.motion_accel = t.getMotionAccel();
		motionAcceleration = t.getMotionAccel();

		super.path = t.getPath();
		path = t.getPath();

		super.session_id = t.getSessionID();
		sessionID = t.getSessionID();

		super.state = t.getTuioState();
		state = t.getTuioState();
	}
}
