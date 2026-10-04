void setup()
{
size(400, 430);
noLoop();
}

void draw()
{
background(230);
int total = 0;
int dieSize = 100;
int gap = 10;
int cols = 3;
int rows = 3;

for (int row = 0; row < rows; row++)
{
for (int col = 0; col < cols; col++)
{
int x = gap + col * (dieSize + gap);
int y = gap + row * (dieSize + gap);
Die d = new Die(x, y);
d.show();
total += d.value;
}
}

fill(0);
textAlign(CENTER);
textSize(24);
text("Total: " + total, width / 2, 400);
}

void mousePressed()
{
redraw();
}

class Die
{
int myX, myY, value, dieSize;

Die(int x, int y)
{
myX = x;
myY = y;
dieSize = 100;
value = (int)(Math.random() * 6) + 1;
}

void show()
{
fill(255);
stroke(0);
strokeWeight(2);
rect(myX, myY, dieSize, dieSize, 10);

fill(0);
noStroke();
int d = 16;
int left = myX + dieSize / 4;
int mid = myX + dieSize / 2;
int right = myX + 3 * dieSize / 4;
int top = myY + dieSize / 4;
int center = myY + dieSize / 2;
int bottom = myY + 3 * dieSize / 4;

if (value == 1 || value == 3 || value == 5)
{
ellipse(mid, center, d, d);
}
if (value >= 2)
{
ellipse(left, top, d, d);
ellipse(right, bottom, d, d);
}
if (value >= 4)
{
ellipse(right, top, d, d);
ellipse(left, bottom, d, d);
}
if (value == 6)
{
ellipse(left, center, d, d);
ellipse(right, center, d, d);
}
}
}
