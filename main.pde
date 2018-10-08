//import java.util.*;
//float horizonPos = 50;
//float verticalPos = 50;
//Vector<Float> circlecenter = new Vector<Float>();
//Vector<Float> circleradius = new Vector<Float>();
//float time = 0;
//int howManyCircles = 1;

//void setup(){
//  size(960, 480);  
//  circlecenter.add(new Float(400));
//  circlecenter.add(new Float(240));
//  circleradius.add(new Float(100));
//}

//void draw() {
//  clear();  
//  float x_pos_of_parent = 0;
//  float y_pos_of_parent = 0;
  
//  for(int i = 0, j = 0; i < circlecenter.size(); i += 2, j++) {
//    float x_pos_of_this_circle = circlecenter.get(i).floatValue() + (float)(circleradius.get(j).floatValue()*Math.cos(time*3.14)) + x_pos_of_parent;
//    float y_pos_of_this_circle = circlecenter.get(i+1).floatValue() - (float)(circleradius.get(j).floatValue()*Math.sin(time*3.14)) - y_pos_of_parent;
//    x_pos_of_parent = x_pos_of_this_circle;
//    y_pos_of_parent = y_pos_of_this_circle;
//    ellipse(x_pos_of_this_circle, y_pos_of_this_circle, 10, 10);
//  }
  
//  time += 0.025;
//}



import java.util.*;
Vector<Float> circleRadius = new Vector<Float>();

float time = 0;

int circleCount = 2;

float mainCircle_x = 500;
float mainCircle_y = 500;
float mainCircle_radius = 300;
Vector<Float> yheights = new Vector<Float>();

int renderBorder = 1000;

void setup() {
  size(2000, 1500);
  circleRadius.add(new Float(mainCircle_radius));
  for(int i = 0 ; i < circleCount; i++){
    // 
    circleRadius.add(new Float(circleRadius.get(circleRadius.size() - 1).floatValue()));
  }
}

void draw(){
  clear();
  float x_pos_of_parent = mainCircle_x;
  float y_pos_of_parent = mainCircle_y;
  ellipse(mainCircle_x, mainCircle_y, 10, 10);
  float lastYheight = 0;
   
  for(int i = 0; i < circleCount; i++) {
    float x = x_pos_of_parent + (float)(circleRadius.get(i).floatValue()*Math.cos(time*3.14*(2*i+1)));
    float y = y_pos_of_parent - (float)(circleRadius.get(i).floatValue()*Math.sin(time*3.14*(2*i+1)));
    
    x_pos_of_parent = x;
    y_pos_of_parent = y;
    ellipse(x, y, 10, 10);
    
    lastYheight = y;
  }    
  
  yheights.add(new Float(lastYheight));
  
  printWave();
  time += 0.025;
}  
  
void printWave(){
  for(int i = 0; i < yheights.size(); i++){
    ellipse(renderBorder + i*2, yheights.get(i).floatValue(), 10, 10);
  }
}