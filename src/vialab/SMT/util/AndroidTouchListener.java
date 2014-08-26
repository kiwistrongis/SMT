package vialab.SMT.util;

private static class AndroidTouchListener implements View.OnTouchListener {
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
