class Boost{
  
   int boostx;          //x pos of boost
   int boosty;          //y pos of boost
  
  Boost(){
    
    boostx = int(random(20,980));    //boost is placed at random location
    boosty = int(random(20,780)); 
    
    
  }
  
  void place(){                      //places the boost pannels
    fill(#FEFF00);
    rect(boostx,boosty,38,22);
  }
  
}
