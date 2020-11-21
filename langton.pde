int grid[][];
int x;
int y;
int dir;

int antup=0;
int antright=1;
int antdown=2;
int antleft=3;

void setup()
{
  size(400,400);
  grid=new int[width][height];
  x=width/2;
  y=height/2;
  grid[x][y]=1;
}

void turnright()
{
  dir=dir+1;
  if(dir==4) dir=0;
}

void turnleft()
{
  dir=dir-1;
  if(dir==-1) dir=3;
}

void draw()
{
  background(255);
  int state;
  
  state=grid[x][y];
  
  if(state==0)
  {
    turnright();
    grid[x][y]=1;
    moveForward();
  }
  else if(state==1)
  {
    turnleft();
    grid[x][y]=0;
    moveForward();
  }
  showgrid();
  
}

void moveForward()
{
  if(dir==antup)     y-=10;
  if(dir==antright)  x+=10; else
  if(dir==antdown)   y+=10; else
  if(dir==antleft)   x-=10;
  
  if(x>width-1) x=0; else 
  if(x<0) x=width-1;
  if(y>height-1) y=0; else 
  if(y<0) y=height-1;
}

void showgrid()
{
   strokeWeight(4);
   stroke(0);
   for(int i=0; i<width; i+=10)
   {
     for(int j=0; j<height; j+=10)
     {
       if(grid[i][j]==1) ellipse(i,j,5,5);
     }
   }
}
