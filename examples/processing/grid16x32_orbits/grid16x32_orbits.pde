OPC opc;
PImage dot1, dot2;

void setup()
{
  size(640, 360);
  frameRate(20);

  dot1 = loadImage("greenDot.png");
  dot2 = loadImage("purpleDot.png");

  // Connect to the local instance of fcserver. You can change this line to connect to another computer's fcserver
  opc = new OPC(this, "192.168.1.9", 7890);

  // Map an 8x8 grid of LEDs to the center of the window, scaled to take up most of the space
  float spacing = height / 14.0;
 // opc.ledGrid8x8(0, width/2, height/2, spacing, HALF_PI, false);
  opc.ledGrid8x8(0 * 64, width * 1/8, height * 1/4, height/16, 0, false);
  opc.ledGrid8x8(1 * 64, width * 3/8, height * 1/4, height/16, 0, false);
  opc.ledGrid8x8(2 * 64, width * 5/8, height * 1/4, height/16, 0, false);
  opc.ledGrid8x8(3 * 64, width * 7/8, height * 1/4, height/16, 0, false);
  opc.ledGrid8x8(4 * 64, width * 1/8, height * 3/4, height/16, 0, false);
  opc.ledGrid8x8(5 * 64, width * 3/8, height * 3/4, height/16, 0, false);
  opc.ledGrid8x8(6 * 64, width * 5/8, height * 3/4, height/16, 0, false);
  opc.ledGrid8x8(7 * 64, width * 7/8, height * 3/4, height/16, 0, false);
}

float px, py;

void draw()
{
  background(0);
  blendMode(ADD);
  
  // Smooth out the mouse location
  px += (mouseX - px) * 0.1;
  py += (mouseY - py) * 0.1;

  float a = millis() * 0.001;
  float r = py * 0.5;
  float dotSize = r * 4;  

  float dx = width/2 + cos(a) * r;
  float dy = height/2 + sin(a) * r;
  
  // Draw it centered at the mouse location
  image(dot1, dx - dotSize/2, dy - dotSize/2, dotSize, dotSize);

  // Another dot, mirrored around the center
  image(dot2, width - dx - dotSize/2, height - dy - dotSize/2, dotSize, dotSize);
}

