int sizeX = 1000;
int sizeY = 1000;

int gridSizeX;
int gridSizeY;
PVector rectSize;

float speedX;
float speedY;

float sinWave;
float cosWave;


void settings()
{
  size(sizeX,sizeY,P2D);
}
void setup()
{

  gridSizeX = (int) random(10, 30);
  gridSizeY = (int) random(10, 30);
  rectSize = new PVector(sizeX/gridSizeX, sizeY/gridSizeY);
  println(rectSize);

  speedX = 1;
  speedY = 3;
}

void draw()
{
  background(255);

  //Speed based on Mouse Position
  speedX = mouseX / 100;
  speedY = mouseY / 100;


  //Loop to create quads and Animate them using Noise
  for (int i = 0; i < gridSizeX; i++)
  {
    for (int j = 0; j < gridSizeY; j++)
    {
      noStroke();
      fill(noise(i, j, sin(radians(frameCount)+2))*255, noise(i, j, sin(radians(frameCount))+3)*255, noise(i, j, cos(radians(frameCount))+5)*255, 150);
      rect(i*rectSize.x,j*rectSize.y,rectSize.x*calculateSine(i),rectSize.y*calculateCos(j));
      
      //Alternative Animation Pattern
      //rect(i*rectSize.x, j*rectSize.y, rectSize.x*(map(noise(i, j, radians(frameCount+mouseX)), 0, 1, 1, 2)), rectSize.y*(map(noise(i, j, radians(frameCount+mouseY)), 0, 1, 1, 2)));
    }
  }
}

float calculateSine(int input)
{
  float tSine = sin(radians(frameCount*speedX)+input);
  tSine = map(tSine, -1, 1, 1, 2);
  return tSine;
}

float calculateCos(int input)
{
  float tCos = cos(radians(frameCount*speedY)+input);
  tCos = map(tCos, -1, 1, 1, 2);
  return tCos;
}
