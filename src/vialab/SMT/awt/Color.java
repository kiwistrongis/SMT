package vialab.SMT.awt;

public class Color {
	private int red = 0;
	private int green = 0;
	private int blue = 0;
	private int alpha = 255;

	public Color( int red, int green, int blue){
		this.red = red;
		this.green = green;
		this.blue = blue;}
	public Color( int red, int green, int blue, int alpha){
		this.red = red;
		this.green = green;
		this.blue = blue;
		this.alpha = alpha;}

	public int getRed(){
		return this.red;}
	public int getGreen(){
		return this.green;}
	public int getBlue(){
		return this.blue;}
	public int getAlpha(){
		return this.alpha;}

	public void setRed( int red){
		this.red = red;}
	public void setGreen( int green){
		this.green = green;}
	public void setBlue( int blue){
		this.blue = blue;}
	public void setAlpha( int alpha){
		this.alpha = alpha;}
}