class Kvadrat {

  int cols, rows;
  int scl;
  int w;
  int h;
  int rX;
  int rY;
  int rZ;
  int corY;
  int corX;
  int corZ;

  float flyingy = 0;
  float flyingx = 0;

  float[][] terrain;

  Kvadrat(int _scl, int _w, int _h, int _corX, int _corY,int _corZ, int _rX,int _rY,int _rZ) {
    corX = _corX;
    corY = _corY;
    corZ = _corZ;
    rX = _rX;
    rY = _rY;
    rZ = _rZ;
    scl = _scl;
    w = _w;
    h = _h;
    cols = w / (scl);
    rows = h / (scl);
    terrain = new float[cols][rows]; 
  }
  
  
  void run() {
    
   rotateX(radians(rX));
   rotateY(radians(rY));
   rotateZ(radians(rZ));
   translate(-w/2, -h/2);
   translate(corX,corY,corZ);
    
    //if(mouseY > 350 && mouseY < 450) 
    flyingy -= (50*0.002)-2*(amp.analyze()/4);

    //if(mouseX > 350 && mouseX < 450) 
    flyingx -= (50*0.002)-2*(amp.analyze()/4);
    


    float yoff = flyingy;
    for (int y = 0; y < rows; y++) {
      float xoff =  flyingx;
      for (int x = 0; x < cols; x++) {
        terrain[x][y] = map((noise(xoff, yoff)*(amp.analyze()/2)), 0, 1, 0, 255);
        //terrain[x][y] = random(255);
        xoff += 0.02;
      }
      yoff += 0.02;
    } 
    stroke(0,50);
   
    

    for (int y = 0; y < rows-1; y++) {
      beginShape(TRIANGLE_STRIP);
      for (int x = 0; x < cols; x++) {
        fill((110+(terrain[x][y]-1)*1), 200-(terrain[x][y]-1)*0.5, 255-(terrain[x][y]-1)*2);
        vertex(x*scl, y*scl, terrain[x][y]);
        vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
        //rect(x*scl, y*scl, scl, scl);
        
       
      }
     
      endShape(); 
    }
  }
}
