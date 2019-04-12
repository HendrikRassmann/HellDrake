class Renderer{
  
  public PImage Xresult = createImage(width,height,RGB);
  boolean noDoubles;
  boolean no2;
  
  Renderer(){
    Xresult =  createImage(width,height,RGB);
    noDoubles = false;
    no2 = false;
  }
  void toggleDoubles(){
    noDoubles = !noDoubles;
  }
    void no2(){
    no2 = !no2;
  }
  
  void clearImage(){
    Xresult =  createImage(width,height,RGB);
  }
  
  public PImage getRender(){
   return Xresult; 
  }
 
  public PImage render(int steps,float[] xCoord,float[] yCoord,color col){
    PImage result = createImage(width,height,RGB);
    //inPut: 2D Points,
    //outPunt: PImage Reder
    //nextUP: Rules
    result.loadPixels();
    
    //generate Directions
    int[] randDirections = new int[steps];
    for (int i = 0; i < randDirections.length;i++){
    randDirections[i] = int(random(xCoord.length));
    
  }
       
  float currentX = xCoord[0];
  float currentY = yCoord[0];

  
  for (int i = 0; i < steps; i++)
  {
    //Rules
   if(noDoubles){
     if (i>0 && randDirections[i] == randDirections[i-1]) {
     continue;
     }
   }
   if(no2){
    if (i > 1 &&  ((randDirections[i] -randDirections[i-1]) == -2 | (randDirections[i] - randDirections[i-1]) == 2) ){ continue;}
   }
   currentX = (currentX + xCoord[randDirections[i]])/2; 
   currentY = (currentY+ yCoord[randDirections[i]])/2; 
   //Rules enforcment
   result.set(int(currentX)+width/2,int(currentY)+height/2,col);
  }
  result.updatePixels(); 
  result.loadPixels();
  return result;
  //image(result,0,0);
  }
}
