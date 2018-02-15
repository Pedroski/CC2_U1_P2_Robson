PVector Position;
PVector Position2;
PVector Direction;
PVector Mouse;
float Speed;

void setup()
{
  size(800,800,P3D);
  Position = new PVector(400,400,-400);
  Position = new PVector(400,400,-400);
  Direction = new PVector(0,0,0);
  Speed = -5;
}

void draw()
{
  background(255,255,255);
  lights();
  if ( mousePressed )
    {
      Mouse = new PVector(mouseX,mouseY,0);
      Direction = PVector.sub(Mouse,Position,Mouse);
      Speed = Direction.mag();
      Direction.normalize();
      Direction.mult(Speed/100);
    }
  
      pushMatrix();
    translate(400,400,-400);
    noFill();
    stroke(0,0,0,255);
    box(800);
    popMatrix();
    
    pushMatrix();
  Position.add(Direction);
  translate(Position.x,Position.y,Position.z);
  noStroke();
  fill(250,0,0);
  sphere(50);

  if ( Position.x > width )
    {
      Direction.x*=-1;
    }
    if ( Position.x < 0 )
    {
      Direction.x*=-1;
    }
    if ( Position.y > height )
    {
      Direction.y*=-1;
    }
    if ( Position.y < 0 )
    {
      Direction.y*=-1;
    }
    if ( Position.z > 0 )
    {
      Direction.z*=-1;
    }
    if ( Position.z < -800 )
    {
      Direction.z*=-1;
    }
    popMatrix();
}