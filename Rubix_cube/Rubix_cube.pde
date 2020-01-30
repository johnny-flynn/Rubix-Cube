  import peasy.*;
  import java.util.Scanner;
  
  PeasyCam cam;
  int dimensions = 3;
  Cubie[] box = new Cubie[dimensions*dimensions*dimensions];
  public void settings(){
    size(800, 800, P3D);
  }
  
  void setup(){
    cam = new PeasyCam(this, 400);
    int boxID = 0;
    for(int x = -1; x <= 1; x++){
      for(int y = -1; y <= 1; y++){
        for(int z = -1; z <= 1; z++){
          PMatrix3D cubieMatrix = new PMatrix3D();
          cubieMatrix.translate(x,y,z);
          box[boxID] = new Cubie(cubieMatrix, x, y, z);
          boxID++;
        }
      }
    }
  }
  
  void RandomizeCube(int f){
    int max = 5;
    int min = 0;
    double randomD = Math.random();
    randomD = randomD * 50 + 1;
    println(randomD);
    for(int r = 0; r < randomD; r++){
      double randomDouble = Math.random();
      randomDouble = randomDouble * max + min;
      int randomInt = (int) randomDouble;
      if(randomInt == 0){
        turnZ(-1);
      }
      else if(randomInt == 1){
        turnZ(1);
      }
      else if(randomInt == 2){
        turnY(-1);
      }
      else if(randomInt == 3){
        turnY(1);
      }
      else if(randomInt == 4){
        turnX(-1);
      }
      else if(randomInt == 5){
        turnX(1);
      }
    }
  }
  void buildRandom(int key){
      int num = key;
      RandomizeCube(num); 
      
      
    }
  void turnX(int boxID){
    for(int i = 0; i < box.length; i++){
      Cubie rotate = box[i];
      if(rotate.x == boxID){
        PMatrix2D cubieMatrix = new PMatrix2D();
        cubieMatrix.rotate(HALF_PI);
        cubieMatrix.translate(rotate.y, rotate.z);
        rotate.update(rotate.x, round(cubieMatrix.m02), round(cubieMatrix.m12)); //rounding avoids type errors between type int and type float
        rotate.turnFacesX();
      }
    }
  }
  
  void turnY(int boxID){
    for(int i = 0; i < box.length; i++){
      Cubie rotate = box[i];
      if(rotate.y == boxID){
        PMatrix2D cubieMatrix = new PMatrix2D();
        cubieMatrix.rotate(HALF_PI);
        cubieMatrix.translate(rotate.x, rotate.z);
        rotate.update(round(cubieMatrix.m02), rotate.y, round(cubieMatrix.m12)); //rounding avoids type errors between type int and type float
        rotate.turnFacesY();
      }
    }
  }
  
  void turnZ(int boxID){
    for(int i = 0; i < box.length; i++){
      Cubie rotate = box[i];
      if(rotate.z == boxID){
        PMatrix2D cubieMatrix = new PMatrix2D();
        cubieMatrix.rotate(HALF_PI);
        cubieMatrix.translate(rotate.x, rotate.y);
        rotate.update(round(cubieMatrix.m02), round(cubieMatrix.m12), round(rotate.z)); //rounding avoids type errors between type int and type float
        rotate.turnFacesZ();
       }
    }
  }
  
  void keyPressed(){
    
    switch(key){
      case '1':
      turnX(1);
      break;
      case '2':
      turnX(-1);
      break;
      case '3':
      turnY(1);
      break;
      case '4':
      turnY(-1);
      break;
      case '5':
      turnZ(1);
      break;
      case '6':
      turnZ(-1);
      break; 
      case' ':
      buildRandom(key);
      break;
    }
  }
    
  
  void draw(){
    scale(60);
    background(100);
    for(int i = 0; i < box.length; i++){
          box[i].show();
        }
      }
    
