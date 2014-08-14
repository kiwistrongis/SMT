import vialab.SMT.*;
import java.util.Vector;
import android.util.Log;

void setup(){
	//SMT.init( this);
	Vector<String> loaded = new Vector<String>();
	Vector<String> unloaded = new Vector<String>();
	for( String class_name : class_list())
		try{
			Class.forName( class_name);
			loaded.add( class_name);}
		catch( ClassNotFoundException exception){
			unloaded.add( class_name);}
	//print loaded classes
	Log.d( "Asdf", "Loaded Classes:");
	for( String name : loaded)
		Log.d( "Asdf", String.format( "\t%s\n", name));
	//print not loaded classes
	Log.d( "Asdf", "Unloaded Classes:");
	for( String name : unloaded)
		Log.d( "Asdf", String.format( "\t%s\n", name));
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

public String[] class_list(){
	return new String[]{
		"vialab.SMT.SMTTuioListener",
		"vialab.SMT.AndroidToTUIO",
		"vialab.SMT.ButtonZone",
		"vialab.SMT.CheckBoxZone",
		"vialab.SMT.ContainerZone",
		"vialab.SMT.event.TouchEvent",
		"vialab.SMT.event.TouchListener",
		"vialab.SMT.Finger",
		"vialab.SMT.ImageZone",
		"vialab.SMT.KeyboardZone",
		"vialab.SMT.LeftPopUpMenuZone",
		"vialab.SMT.MainZone",
		"vialab.SMT.MouseToTUIO",
		"vialab.SMT.PatternUnlockZone",
		"vialab.SMT.PieMenuZone",
		"vialab.SMT.renderer.P3DDSRenderer",
		"vialab.SMT.renderer.PGLDSRenderer",
		"vialab.SMT.renderer.PGraphics3DDelegate",
		"vialab.SMT.renderer.PGraphicsOpenGLDelegate",
		"vialab.SMT.ShapeZone",
		"vialab.SMT.Simulation",
		"vialab.SMT.SlideRevealZone",
		"vialab.SMT.SliderZone",
		"vialab.SMT.SMT",
		"vialab.SMT.SMTTouchManager",
		"vialab.SMT.SMTUtilities",
		"vialab.SMT.swipekeyboard.AnchorZone",
		"vialab.SMT.swipekeyboard.ArrowKeysLayout",
		"vialab.SMT.swipekeyboard.CondensedLayout",
		"vialab.SMT.swipekeyboard.DebugSwipeKeyboardListener",
		"vialab.SMT.swipekeyboard.DefaultSwipeResolver",
		"vialab.SMT.swipekeyboard.ExtendedLayout",
		"vialab.SMT.swipekeyboard.KeyZone",
		"vialab.SMT.swipekeyboard.ModifierKeyZone",
		"vialab.SMT.swipekeyboard.SwipeKeyboardEvent",
		"vialab.SMT.swipekeyboard.SwipeKeyboardLayout",
		"vialab.SMT.swipekeyboard.SwipeKeyboardListener",
		"vialab.SMT.swipekeyboard.SwipeKeyEvent",
		"vialab.SMT.swipekeyboard.SwipeKeyListener",
		"vialab.SMT.swipekeyboard.SwipeKeyZone",
		"vialab.SMT.swipekeyboard.SwipeResolver",
		"vialab.SMT.SwipeKeyboard",
		"vialab.SMT.TabZone",
		"vialab.SMT.TexturedTouchDrawer",
		"vialab.SMT.TextureZone",
		"vialab.SMT.TextZone",
		"vialab.SMT.Touch",
		"vialab.SMT.TouchClient",
		"vialab.SMT.TouchDraw",
		"vialab.SMT.TouchDrawer",
		"vialab.SMT.TouchPair",
		"vialab.SMT.TouchSource",
		"vialab.SMT.TouchState",
		"vialab.SMT.TuioConnectionException",
		"vialab.SMT.util.ActiveDisplayTouchBinder",
		"vialab.SMT.util.DisplayTouchBinder",
		"vialab.SMT.util.ProxyTuioListener",
		"vialab.SMT.util.RectTouchBinder",
		"vialab.SMT.util.ScreenTouchBinder",
		"vialab.SMT.util.SketchTouchBinder",
		"vialab.SMT.util.SystemAdapter",
		"vialab.SMT.util.TouchBinder",
		"vialab.SMT.util.ZonePicker",
		"vialab.SMT.ViewportZone",
		"vialab.SMT.Zone"};}
