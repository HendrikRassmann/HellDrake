class World{
 ArrayList<Fractal> Fractals;
 ArrayList<Polygon> Polygons;
 Camera cam;
 
 World()
 {
  Fractals = new ArrayList<Fractal>();    
  cam = new Camera();
 }
  void registerFractal(Fractal f){
   Fractals.add(f); 
}
void armagedonn(){
 Fractals.clear(); 
}

void renderScene(){
  for (Fractal f : Fractals){
    cam.project(f);
  }
}
/*
renderer.render(steps,cam.giveXof(world.Fractals.get(0)),cam.giveYof(world.Fractals.get(0)),world.Fractals.get(0).getColor());
  renderer.render(steps,cam.giveXof(world.Fractals.get(1)),cam.giveYof(world.Fractals.get(1)),world.Fractals.get(1).getColor());*/

  
}
