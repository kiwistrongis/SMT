package vialab.SMT.awt;

public class Rectangle {
	public int x;
	public int y;
	public int width;
	public int height;

	public Rectangle( int x, int y, int width, int height){
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;}

 	public int getX(){
		return this.x;}
	public int getY(){
		return this.y;}
	public int getWidth(){
		return this.width;}
	public int getHeight(){
		return this.height;}

	public void setX( int x){
		this.x = x;}
	public void setY( int y){
		this.y = y;}
	public void setWidth( int width){
		this.width = width;}
	public void setHeight( int height){
		this.height = height;}

}