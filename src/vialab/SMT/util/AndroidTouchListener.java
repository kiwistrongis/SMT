package vialab.SMT.util;

//android imports
import android.view.MotionEvent;
import android.view.View;

public class AndroidTouchListener implements View.OnTouchListener {
	public AndroidTouchListener(){}
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

		switch( action){
			case MotionEvent.ACTION_CANCEL:
				break;
			case MotionEvent.ACTION_DOWN:
				break;
			case MotionEvent.ACTION_MOVE:
				break;
			case MotionEvent.ACTION_POINTER_DOWN:
				break;
			case MotionEvent.ACTION_POINTER_UP:
				break;
			case MotionEvent.ACTION_UP:
				break;
			default:
				break;}

		return true;
	}
}
