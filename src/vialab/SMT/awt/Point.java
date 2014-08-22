package vialab.SMT.awt;

public class Point {
	public int x;
	public int y;

	public Point( int x, int y){
		this.x = x;
		this.y = y;}

	public int getX(){
		return this.x;}
	public int getY(){
		return this.y;}

	public void setX( int x){
		this.x = x;}
	public void setY( int y){
		this.y = y;}

	public double distance( Point point){
		return distance( point.x, point.y);}
	public double distance( double px, double py){
		return Math.sqrt( distanceSq( px, py));}
	public double distanceSq( Point point){
		return distanceSq( point.x, point.y);}
	public double distanceSq( double px, double py){
		return Math.pow( px, 2) + Math.pow( py, 2);}
}