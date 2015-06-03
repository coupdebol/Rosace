PGraphics pg;
int ANGLE_STEP = 45;
int RADIUS = 250;

void setup() {
  smooth();
  frameRate(3);
  background(0);
  size(800, 600,P3D);
  pg = createGraphics(800, 600, P3D);
}
  
void draw() {
  float xcFirst = GetXPosition(0);
  float ycFirst = GetYPosition(0);
  float xc = 0, yc = 0;
  pg.beginDraw();
  pg.background(0);
  pg.stroke(255);
  pg.fill(100, 255, 255, 100);
  pg.beginShape();
   
  pg.curveVertex(xcFirst, ycFirst);
  pg.curveVertex(xcFirst, ycFirst);
  for (int angle = ANGLE_STEP; angle < 361; angle += ANGLE_STEP) {
    xc = GetXPosition(angle);
    yc = GetYPosition(angle);
    pg.curveVertex(xc, yc);
    drawCircle(xc,yc);
  }
  pg.curveVertex(xcFirst, ycFirst);
  
  
  pg.endShape();
  pg.endDraw();
  image(pg, 0, 0);
} 

float GetXPosition(float angle)
{
  return cos(radians(angle)) * RADIUS + width/2;
}
float GetYPosition(float angle)
{
  return sin(radians(angle)) * RADIUS + height/2;
}

void drawCircle(float x, float y)
{
  fill(255);
  stroke(255);
  ellipse(x,y,15,15); 
  line(x,y,width/2,height/2);
}
 

