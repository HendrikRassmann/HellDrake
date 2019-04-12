/*
Hendrik Rassmann
Project Heldrake
*/
int numberOfPoints = 3;
int steps = 1;
String rotAxis = "X";
boolean presentationMode = false;
ArrayList<Vertex> Vertecies = new ArrayList<Vertex>();
Renderer renderer = new Renderer();
World world = new World();
float movementSpeed = 10;

void setup(){
  size(640,640);
  frameRate(30);
  
  translate(width/2,height/2);   
  
  update();

}
void draw(){  
  
  translate(width/2,height/2);   
  //mit niedrigen werten kann mans gut erklären
  //monsta zeile
  //wiederherstellungsversuch:
  PImage renderRes = renderer.render(steps,world.cam.giveXof(world.Fractals.get(0)),world.cam.giveYof(world.Fractals.get(0)),world.Fractals.get(0).getColor());
  //renderRes = createImage(width,height,RGB);
  //renderRes = renderer.getRender();
  image (renderRes,-width/2,-height/2);
  
  /*
  renderer.render(steps,cam.giveXof(world.Fractals.get(0)),cam.giveYof(world.Fractals.get(0)),world.Fractals.get(0).getColor());
  renderer.render(steps,cam.giveXof(world.Fractals.get(1)),cam.giveYof(world.Fractals.get(1)),world.Fractals.get(1).getColor());
  */
  
 // world.renderScene();  
  

  /*renderer.render(steps,cam.giveXof(world.Fractals.get(0)),cam.giveYof(world.Fractals.get(0)),world.Fractals.get(0).getColor());
  PImage renderResult = renderer.getRender();
  image (renderResult,-width/2,-height/2);
  */

}
void keyPressed(){
   if (keyPressed){
   if(keyCode == UP){ world.Fractals.get(0).translate(0,-movementSpeed,0); return;}
   if(keyCode == DOWN){ world.Fractals.get(0).translate(0,movementSpeed,0); return;}
   if(keyCode == LEFT){ world.Fractals.get(0).translate(-movementSpeed,0,0); return;}
   if(keyCode == RIGHT){ world.Fractals.get(0).translate(movementSpeed,0,0); return;}
   if(keyCode == ENTER){ world.Fractals.get(0).translate(0,0,50*movementSpeed); return;}
   if(keyCode == SHIFT){ world.Fractals.get(0).translate(0,0,50*-movementSpeed); return;}
   if(key == '.'){ world.Fractals.get(0).rotateAxis(4,rotAxis); return;}
   if(key == ','){ world.Fractals.get(0).rotateAxis(-4,rotAxis); return;}
   if(key == 'm') {numberOfPoints++;update();}
   if(key == 'n') {numberOfPoints--  ;update();}
   if(key == '3') {numberOfPoints=3;update();}
   if(key == '4') {numberOfPoints=4;update();}
   if(key == '5') {numberOfPoints=5;update();}
   if(key == '6') {numberOfPoints=6;update();}
   if(key == '7') {numberOfPoints=7;update();}
   if(key == '8') {numberOfPoints=8;update();}
   if(key == '9') {numberOfPoints=9;update();}
   if(key == 'p') presentationMode = !presentationMode;
   if(key == 'd') {renderer.toggleDoubles();update();}
   if(key == 'f') {renderer.no2();update();}
   if(key == 'y') rotAxis = "Y";
   if(key == 'x') rotAxis = "X";
   if(key == 'z') rotAxis = "Z";
   if(key == 'a' && steps > 2) {steps/=2; println(frameRate);println(steps);redraw();}
   if(key == 'q') {steps*=2 ; println(frameRate);println(steps);redraw();}
   if(key == '1') loop();
   if(key == '2') {
     noLoop();
     return;
   }

  }
}

void update(){
  background(0);
  world.armagedonn();
  world.registerFractal(new Fractal(numberOfPoints,color(255)));
  redraw();
  //world.registerFractal(new Fractal(numberOfPoints,color(0,255,0)));
  //world.Fractals.get(1).translate(5,5,5);

}
  
