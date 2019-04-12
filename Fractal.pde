class Fractal{
 
  //ectl. erzeugt jedes Fractal einfafch seine eigenen Punkte => kein Flimmern
  //centroid
  
  ArrayList<Vertex> Vertecies;
  color col = color(255,255,255);
  int vertexCount = 0;
  
  Fractal(){
   Vertecies = new ArrayList();    
   vertexCount = 0;
  }
  Fractal(ArrayList<Vertex> newVertecies){
   Vertecies = newVertecies; 
   vertexCount = newVertecies.size();
  }
  Fractal(int numberOfPoints,color c)
  {
   Vertecies = new ArrayList();
   col = c;
  float angle = TWO_PI / numberOfPoints;
  float radius = min(width,height)/2;
    for (int i = 0; i < numberOfPoints; i++){                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

    float x = radius * cos(angle*(i)-PI/2);
    float y = radius * sin(angle*(i)-PI/2);
    //Vertex einfügen
    //nullpointer
    Vertecies.add(new Vertex(x,y));
    vertexCount = Vertecies.size();
   }
 }
 color getColor(){
  return col; 
 }
 
  void addVertex(Vertex newVertex){
   Vertecies.add(newVertex); 
  }
  void removeVertex(Vertex killVertex){
   Vertecies.remove(killVertex); 
  }
  void describe(){
   println("Number of Vertecies: " + str(vertexCount)); 
   for (Vertex v : Vertecies){
    print(v.getX() + "    ");
    println(v.getY());
   }
  }
  
  void translate(float xT, float yT, float zT){
    for (Vertex v : Vertecies){
      v.translate(xT,yT,zT);
    }
  }
  void rotateZ(float phi){
   //5 grad um y achse#
   //phi = radians(phi);
   for (Vertex v : Vertecies){
       v.rotateZ(phi);
    }   
  }
  void rotateAxis(float phi, String axis){
   phi = radians(phi);
   float cX = 0;
   float cY = 0;
   float cZ = 0;
   for (Vertex v : Vertecies){
     cX += v.x;
     cY += v.y;
     cZ += v.z;
   }
   cX /= vertexCount;
   cY /= vertexCount;
   cZ /= vertexCount;
   
   for (Vertex v: Vertecies){
    v.x -= cX;
    v.y -= cY;
    v.z -= cZ;
    if (axis.equals("X")) v.rotateX(phi);
    if (axis.equals("Y")) v.rotateY(phi);
    if (axis.equals("Z")) v.rotateZ(phi);
    v.x += cX;
    v.y += cY;
    v.z += cZ;    
   }  
   
   
   
  }
   
  
}
