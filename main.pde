import java.util.*;

// contians list of circle radii. to be filled in setup()
Vector<Float> circleRadius = new Vector<Float>();

// timer.
float time = 0;

// play with this. contains amount of circles to be drawn
int circleCount = 50;

// stores info of fundamental circle
float mainCircle_x = 500;
float mainCircle_y = 500;
float mainCircle_radius = 100;

// contains list of the y value of the last circle in the connected circles
Vector<Float> yheights = new Vector<Float>();

// starting point of wave render
int renderBorder = 1000;

void setup() {
  size(3000, 1500);
  for(int i = 0 ; i < circleCount; i++){
    // mainCircle_radius is multiplied by the b_n formula of the square wave fourier seies.
    // fills up circleRadius
    circleRadius.add(new Float(mainCircle_radius * (4/(3.14*(2*i+1)))));
  }
}

void draw(){
  clear();
  
  float x_pos_of_parent = mainCircle_x;
  float y_pos_of_parent = mainCircle_y;
  
  // draws centre point. not a part of the edges of circles
  ellipse(mainCircle_x, mainCircle_y, 10, 10);
  
  // delcaration of lastYheight. important
  float lastYheight = 0;
   
  for(int i = 0; i < circleCount; i++) {
    // calculates x and y positions of the points of the circles. 
    // note that the centres of these circles are the points drawn from their parents. this is vector addition.
    float x = x_pos_of_parent + (float)(circleRadius.get(i).floatValue()*Math.cos(time*3.14*(2*i+1)));
    float y = y_pos_of_parent - (float)(circleRadius.get(i).floatValue()*Math.sin(time*3.14*(2*i+1)));
    
    // stores x and y pos for child's purpose
    x_pos_of_parent = x;
    y_pos_of_parent = y;
    
    // draws the point
    ellipse(x, y, 10, 10);
    
    // note that lastyheight is replaced every iteration. the last value persists.
    lastYheight = y;
  }    
  
  // last y height is stored in list for rendering of the composite wave
  yheights.add(new Float(lastYheight));
  
  printWave();
  
  // progresses time. you can change how time passes. i chose a time scale of 0.025
  time += 0.02;
}  
  
  
// prints the composite wave by going through the list of y heights
void printWave(){
  for(int i = 0; i < yheights.size(); i++){
    ellipse(renderBorder + i*5, yheights.get(i).floatValue(), 10, 10);
    if(i > 0){
      stroke(255);
      line(renderBorder + (i+1)*5, yheights.get(i).floatValue(), renderBorder + i*5, yheights.get(i-1).floatValue());
    }
    
  }
}