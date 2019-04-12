class Vertex{

  float x;
  float y;
  float z = -500;
  
  Vertex(float setX, float setY){
    x = setX;
    y = setY;
  }
  float getX(){
    return x;
  }
  float getY(){
   return y; 
  }  
  float getZ(){
   return z; 
  }
  PVector getVector(){
   return new PVector(x,y,z); 
  }
  void translate(float xT, float yT, float zT){
    x += xT;
    y += yT;
    z += zT;    
  }
  void rotateX(float phi){
    float newY = y*cos(phi) - z*sin(phi);
    float newZ = y*sin(phi) + z*cos(phi);
    y = newY;
    z = newZ;
  }
  void rotateY(float phi){
    float newZ = z*cos(phi) - x*sin(phi);
    float newX = z*sin(phi) +  x*cos(phi);
    z = newZ;
    x = newX;
  }
    void rotateZ(float phi){
    float newX = x*cos(phi) - y*sin(phi);
    float newY = x*sin(phi) + y*cos(phi);
    y = newY;
    x = newX;
  }

  
}
