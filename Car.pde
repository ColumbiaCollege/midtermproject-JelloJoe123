class Car{
  
  //properties
  float xPos;       //change in x pos
  float yPos;       
  float spd;      //factor of speed
  int bodcrx;     // bod of car pos x
  int bodcry;     //car body y position
  int ywhl;       //wheel pos y
  int lwhlx;       // left wheel pos x
  int rwhlx;      // right wheel pos x
  int ycrlin;      //window line y pos
  int xcrlin1;      // window line 1 x pos
  int xcrlin2; 
  int xwndshld;  // before clicked windshield pos x
  int ywndshld;   //before clicked windowshield pos y
  int xupwhl1;   //x pos of whl 1 when up/dwn
  int yupwhl1;   // y pos of whl 1 when up/dwn
  int rxupwhl1;  //right x pos of whl 1 when up/dwn
  int xupwhl2;   //second x pos of whl 2 when up/dwn
  int yupwhl2;   //second y pos of whl 2 when up/dwn
  int xtpcrbck;     // x pos of car when backwards
  int tpcrsz;     //the size of the top of the car
  int topcrx;     //top of car pos x
  int topcry;     
  boolean right;
  boolean left;
  boolean down;
  boolean up;
  boolean fast;
  boolean slow;
  int l;         //length for hitbox
  int w;         //width for hitbox
 
  
  
  
  //constructor
  Car(){
  xPos =500;       //change in x pos
  yPos = 400; 
  spd=1;
  bodcrx = 30;     // bod of car pos x
  bodcry = 10;
  ywhl = 10;       //wheel pos y
  lwhlx = 5;       // left wheel pos x
  rwhlx = 25;      // right wheel pos x
  ycrlin = 4;      //window line y pos
  xcrlin1= 0;      // window line 1 x pos
  xcrlin2 = 18; 
  xwndshld = -1000;  // before clicked windshield pos x
  ywndshld = 1000;   //before clicked windowshield pos y
  xupwhl1 = -1000;   //x pos of whl 1 when up/dwn
  yupwhl1 = -1000;   // y pos of whl 1 when up/dwn
  rxupwhl1 = -1000;  //right x pos of whl 1 when up/dwn
  xupwhl2 = -1000;   //second x pos of whl 2 when up/dwn
  yupwhl2 = -1000;   //second y pos of whl 2 when up/dwn
  xtpcrbck = 0;     // x pos of car when backwards
  tpcrsz = 0; 
  topcrx = 20;     //top of car pos x
  topcry = 7;
  right = false;
  left = false;
  down = false;
  up = false;
  fast = false;
  slow = false;
  l = 40;
  w = 36;
  }
  
  
  //methods
  
  void display(){
    fill(200,10,0);
  rect(xPos+xtpcrbck, yPos-10,topcrx+tpcrsz,topcry);        //top of car
  rect(xPos, yPos, bodcrx, bodcry);                         //body of car
  fill(0);
  ellipse(xPos+lwhlx, yPos+ywhl,10,10);                       //left wheel
  ellipse(xPos+rwhlx, yPos+ywhl,10,10);                       //rear wheel
  rect(xPos + xcrlin1+xtpcrbck,yPos-ycrlin, 2,5);             //line 1
  rect(xPos+xcrlin2+xtpcrbck,yPos-ycrlin, 2,5);               //line 2
  fill(#CBE4F5);
  rect(xPos+xwndshld,yPos-ywndshld,18,5);                      // windshield
  fill(0);
  ellipse(xPos+xupwhl1,yPos+yupwhl1,2,10);                     //first pair of up wheels
  ellipse(xPos+rxupwhl1, yPos+yupwhl1,2,10);  
  ellipse(xPos+xupwhl1, yPos+yupwhl2,2,10);                    //second pair of up wheels
  ellipse(xPos+xupwhl2,yPos+yupwhl2,2,10);  
  if (left) {                                            //when left is true, the xpos will decrease at the rate of speed
    xPos = xPos - spd;
  }
  
  if (right) {                                            //when right is true, the xpos will increase at the rate of speed
    xPos = xPos + spd;
  }
  
  if (down) {                                            //when down is true, the ypos will increase at the rate of speed
    yPos = yPos + spd;
  }
  
  if (up) {                                            //when up is true, the ypos will decrease at the rate of speed
    yPos = yPos - spd;
  }
  
  if (fast && spd<5){                                   //when fast is true, the rate of speed will increase but no greater than 5
    spd = spd*1.1;
  } else {                                              //if not, it remains the same
    spd = spd*1; 
  }
  
  if (slow && spd>0.5){                              //when slow is true, the rate of speed will decrease but no greater than .5
    spd = spd/1.1;
  } else {                                          //if not, it remains the same
    spd = spd*1;
  }
  
  if (slow && fast){                             //when both are true, the rate of speed will go back to normal and will reset
    spd = 1;
    slow = false;
    fast = false;
  }
  
  
  
  //if the distance between P1 and Cop is smaller than the total radius between them, then P1 will be unable to move
  if ( dist(player1.xPos, player1.yPos, dirtypig.xPoscp, dirtypig.yPoscp) < (player1.w+player1.l-55)/2 + (dirtypig.w+dirtypig.l-55)/2){
  player1.spd = 0;
  }else{
  player1.spd = spd*1;
  }
  //if the distance between P2 and Cop is smaller than the total radius between them, then P2 will be unable to move
  if ( dist(player2.xPos, player2.yPos, dirtypig.xPoscp, dirtypig.yPoscp) < (player2.w+player1.l-55)/2 + (dirtypig.w+dirtypig.l-55)/2){
  player2.spd = 0;
  }else{
  player2.spd = spd*1;
  }
 //if the distance between P1 and P2 and Cop are both smaller than the total radius between them, then you will lose the game
  if (player1.spd == 0 && player2.spd == 0){
  fill(255);
  rect(20,10,960,700);
  fill(200,0,0);
  textSize(50);
  text("YOU LOSE", 360,350);
  textSize(30);
  fill(#E88336);
  text("Score:",380,385);
  text(frameCount/60, 520, 385);
  noLoop();                                       //allows score to be stopped
  }else{
  spd = spd*1;
  }
  
  
}



void increase(){                                 //when increase happens, you will be able to go faster
  fast = true;
}

void decrease(){                                //when decrease happens, slowing will be enabled
   slow = true; 
}

  

//Pressed Methods (move method)
void a(){                                    //when a is pressed, left movement will happen and the x position of the top of the car will change
  left = true;
  xtpcrbck = 10;
}

void d(){
   right = true;
}

void w(){
  up = true;
    bodcrx = 20;         //when w is pressed, x length of the car body becomes 20
    bodcry = -30;        //when w is pressed, y length of the car body becomes 30
    lwhlx =  -10000;      // left wheel goes off screen
    rwhlx = -10000;       // right wheel goes off screen
    xcrlin1 = -10000;     // line 1 goes off screen
    xcrlin2= -10000;      // line 2 goes off screen
    ycrlin = -10000;
    xwndshld = 1;       // windshield x pos goes to 1
    ywndshld = 22;      //windshield y pos goes to 22
    xupwhl1 = 0;        //x wheel pos goes to 0
    yupwhl1 = -6;       // whl 1 moves to y = -6 from pos
    rxupwhl1 = 20;      // whl 1 moves to x = 20 from pos
    yupwhl2 = -23;      // wheel 2 moves up 23
    xupwhl2 = 20;       // wheel 2 moves right 20
    tpcrsz = -9;        // top of the car shrinks
}

void s(){
   down = true;       
    bodcrx = 20;        //when s is pressed, x length of the car body becomes 20
    bodcry = -30;       //when s is pressed, y length of the car body becomes 30
    lwhlx =  -10000;     // left wheel goes off screen
    rwhlx = -10000;      // right wheel goes off screen
    xcrlin1 = -10000;    // line 1 goes off screen
    xcrlin2= -10000;     // line 2 goes off screen
    ycrlin = -10000;
    xwndshld = 1;       //windshield x pos goes to 1
    ywndshld = 11;      //windshield y pos goes to 11
    xupwhl1 = 0;        //x wheel pos goes to 0
    yupwhl1 = -6;       // whl 1 moves to y = -6 from pos
    rxupwhl1 = 20;      // whl 1 moves to x = 20 from pos
    yupwhl2 = -23;      // wheel 2 moves up 23
    xupwhl2 = 20;       // wheel 2 moves right 20
    tpcrsz = -9;        // top of the car shrinks
}




//Released Methods
void aReleased(){            //when a is released, left movement will stop and the top of th car x pos will go back to normal
   left = false;
    xtpcrbck = 0;
}
void dReleased(){
 right = false; 
}
void wReleased(){
   up = false;                  //up movement stops
    bodcrx = 30;                //body of the car goes back to normal
    bodcry = 10;
    lwhlx = 5;                  // left and right wheel goes back to normal
    rwhlx = 25;
    xcrlin1 = 0;                //all window lines go back to normal
    xcrlin2 = 18;
    ycrlin = 4;
    xwndshld = -1000;            //windhsield, new top of car size, and new wheels disappears
    ywndshld = 1102;
    xupwhl1 = -1000;
    yupwhl1 = -1000;
    rxupwhl1 = -1000;
    yupwhl2 = -1003;
    xupwhl2 = -1000;
    tpcrsz = 0;
}

void sReleased(){
  down = false;
    bodcrx = 30;
    bodcry = 10;
    lwhlx = 5;
    rwhlx = 25;
    xcrlin1 = 0;
    xcrlin2 = 18;
    ycrlin = 4;
    xwndshld = -1111;
    ywndshld = 1000;
    xupwhl1 = -1000;
    yupwhl1 = -1000;
    rxupwhl1 = -1000;
    yupwhl2 = -1003;
    xupwhl2 = -1000;
    tpcrsz = 0; 
}


////Hitbox shown
//void hitbox(float tempx, float tempy){
//  if(up || down ){
//    tempx = tempx-5;
//    tempy = tempy-16;
//    l = 32;
//  } else {
//    l = 40;
//  }
//   ellipse(tempx+15, tempy+2, l, w);
//}


}
