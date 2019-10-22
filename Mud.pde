class Mud{
  
  int mudx;         //x pos of mud
  int mudy;         //y pos of mud
  float leng;       //length of mud
  float heit;       //height of mud
  
Mud(){
    
    mudx = int(random(20,980));     //mud is placed randomly
    mudy = int(random(20,780));
    leng = random(25,45);          //height and width are random
    heit = random(25,40);
  }
  
void spill(){                    //draw object
  fill(#906114);
  ellipse(mudx,mudy,leng,heit);
  
}

}
