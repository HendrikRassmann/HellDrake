class Camera{
  /*
  2DO:
  Optimiere Projection (komische mega Matrix berechen, zumindest |u v a-p| vorberechnen)
  
  */
  
  //just throw away Z ;)
  /*
  X => RIGHT
  Y => UP
  Z => TOWARDS
  
  */
  PVector o = new PVector(0,0,0);
  PVector u = new PVector(1,0,0);
  PVector v = new PVector(0,1,0);
  PVector a = new PVector(0,0,8000);
  
  float[] giveXof (Fractal f){
    float[] retX = new float[f.vertexCount];
    for (int i = 0; i< retX.length; i++)
    {
      PVector p =  f.Vertecies.get(i).getVector();
      retX[i] = xProject(p);
      //println (xProject(p));
    }
    return retX;
  }
  float[] giveYof (Fractal f){
    float[] retY = new float[f.vertexCount];
    
    for (int i = 0; i< retY.length; i++)
    {
      PVector p =  f.Vertecies.get(i).getVector();
      retY[i] = yProject(p);
    }
    
    
    return retY;
  }
  void project (Fractal f){
    renderer.render(steps,giveXof(f),giveYof(f),f.getColor());
  }
  float xProject(PVector p){
   return determinant(PVector.sub(a,o),v,PVector.sub(a,p)) / determinant(u,v,PVector.sub(a,p)/*a.sub(p)*/); 
  }
  float yProject(PVector p){
   return determinant(u, PVector.sub(a,o),PVector.sub(a,p))/determinant(u,v,PVector.sub(a,p)); 
  }
  
  float determinant(PVector a, PVector b, PVector c){
    //not Testet Grrr,
   float det = (a.x)*(b.y)*(c.z) + (b.x)*(c.y)*(a.z) +(c.x)*(a.y)*(b.z) - (c.x)*(b.y)*(a.z) -(b.x)*(a.y)*(c.z) -(a.x)*(c.y)*(b.z);
   return det;
  }
  
}
