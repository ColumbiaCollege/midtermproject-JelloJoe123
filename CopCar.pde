class CopCar {
  
  
  //IDEA MAKE AN ARRAY LIST FOR COP CARS SO OVERTIME THERES MORE{ ArrayList<CopCar> CopCars = new ArrayList<CopCar>();   void mouseClicked(){Cars.add(new Car());}
  
  //properties
  float xPoscp;       //change in x pos
  float yPoscp; 
  float spdcp;
  int bodcpx;     // bod of cop car pos x
  int bodcpy;
  int ywhlcp;       //wheel pos y
  int lwhlxcp;       // left wheel pos x
  int rwhlxcp;      // right wheel pos x
  int ycplin;      //window line y pos
  int xcplin1;      // window line 1 x pos
  int xcplin2; 
  int xwndshldcp;  // before clicked windshield pos x
  int ywndshldcp;   //before clicked windowshield pos y
  int xupwhl1cp;   //x pos of whl 1 when up/dwn
  int yupwhl1cp;   // y pos of whl 1 when up/dwn
  int rxupwhl1cp;  //right x pos of whl 1 when up/dwn
  int xupwhl2cp;   //second x pos of whl 2 when up/dwn
  int yupwhl2cp;   //second y pos of whl 2 when up/dwn
  int xtpcpbck;     // x pos of cop car when backwards
  int tpcpsz; 
  int topcpx;     //top of cop car pos x
  int topcpy;
  boolean followD;
  boolean followA;
  boolean followW;
  boolean followS;
  int l;              //hitbox length
  int w;              //hitbox width
  float tempx;        //hitbox position x
  float tempy;         //hitbox y position


  //constructor
  CopCar() {
    xPoscp = int (random (10,990));       //the cop car starts in a random x position
    yPoscp = int (random (10,790));        // the cop car starts in a random y position
    spdcp=1;         // rate of speed of cop
    bodcpx = 30;     // bod of car pos x
    bodcpy = 10;
    ywhlcp = 10;       //wheel pos y
    lwhlxcp = 5;       // left wheel pos x
    rwhlxcp = 25;      // right wheel pos x
    ycplin = 4;      //window line y pos
    xcplin1= 0;      // window line 1 x pos
    xcplin2 = 18; 
    xwndshldcp = -10000;  // before clicked windshield pos x
    ywndshldcp = 10000;   //before clicked windowshield pos y
    xupwhl1cp = -10000;   //x pos of whl 1 when up/dwn
    yupwhl1cp = -10000;   // y pos of whl 1 when up/dwn
    rxupwhl1cp = -10000;  //right x pos of whl 1 when up/dwn
    xupwhl2cp = -10000;   //second x pos of whl 2 when up/dwn
    yupwhl2cp = -10000;   //second y pos of whl 2 when up/dwn
    xtpcpbck = 0;     // x pos of cop when backwards
    tpcpsz = 0; 
    topcpx = 20;     //top of cop pos x
    topcpy = 7;
    followD = false;
    followA = false;
    followS = false;
    followW = false;
    l = 40;
    w = 36;
    tempx = xPoscp+15;         //position of hitbox relative to xPoscp
    tempy = yPoscp+2;
  }


  void show(Car subCar) {    //car called subject of car
  
    fill(0, 10, 200);
    rect(xPoscp+xtpcpbck, yPoscp-10, topcpx+tpcpsz, topcpy);         //top of car
    rect(xPoscp, yPoscp, bodcpx, bodcpy);                           //body of car
    fill(0);
    ellipse(xPoscp+lwhlxcp, yPoscp+ywhlcp, 10, 10);                 //left wheel
    ellipse(xPoscp+rwhlxcp, yPoscp+ywhlcp, 10, 10);                 //rear wheel
    rect(xPoscp + xcplin1+xtpcpbck, yPoscp-ycplin, 2, 5);           //line 1
    rect(xPoscp+xcplin2+xtpcpbck, yPoscp-ycplin, 2, 5);             //line 2
    fill(#CBE4F5);
    rect(xPoscp+xwndshldcp, yPoscp-ywndshldcp, 18, 5);              // windshield
    fill(0);
    ellipse(xPoscp+xupwhl1cp, yPoscp+yupwhl1cp, 2, 10);             //first pair of up wheels
    ellipse(xPoscp+rxupwhl1cp, yPoscp+yupwhl1cp, 2, 10);  
    ellipse(xPoscp+xupwhl1cp, yPoscp+yupwhl2cp, 2, 10);            //second pair of up wheels
    ellipse(xPoscp+xupwhl2cp, yPoscp+yupwhl2cp, 2, 10);    

  //Tracking Commands
  if (dist(xPoscp, yPoscp, player1.xPos, player1.yPos) < dist(xPoscp, yPoscp, player2.xPos, player2.yPos)){    //if the distance between the cop car and player1 is less than that of between cop and beeg yosh, the subject car will be player1
      subCar = player1;
    } else {                                                                                                       // if not, the sub ject car will be P2
      subCar = player2;
   }

  if (followD && subCar.xPos>=xPoscp) {               //if car player1 is to the right, the cop car will move right
        xPoscp = xPoscp + spdcp;
    }
 
  if (followA && subCar.xPos<=xPoscp) {               //if the cop car is to the right of Car, then it will move left and the top of the car will shift in position
        xPoscp = xPoscp - spdcp;
        xtpcpbck = 10;
      } else { 
          xtpcpbck = 0;
    }
    
    //Basically, If it is following it in the up direction, then the shape of the cop car itself will change as well
    if (followW && subCar.yPos<yPoscp){
      yPoscp = yPoscp - spdcp;
      bodcpx = 20;         //when w is pressed, x length of the car body becomes 20
      bodcpy = -30;        //when w is pressed, y length of the car body becomes 30
      lwhlxcp =  -10000;      // left wheel goes off screen
      rwhlxcp = -10000;       // right wheel goes off screen
      xcplin1 = -10000;     // line 1 goes off screen
      xcplin2= -10000;      // line 2 goes off screen
      ycplin = -10000;
      xwndshldcp = 1;       // windshield x pos goes to 1
      ywndshldcp = 22;      //windshield y pos goes to 22
      xupwhl1cp = 0;        //x wheel pos goes to 0
      yupwhl1cp = -6;       // whl 1 moves to y = -6 from pos
      rxupwhl1cp = 20;      // whl 1 moves to x = 20 from pos
      yupwhl2cp = -23;      // wheel 2 moves up 23
      xupwhl2cp = 20;       // wheel 2 moves right 20
      tpcpsz = -9; 
    } else {
        bodcpx = 30;
        bodcpy = 10;
        lwhlxcp = 5;
        rwhlxcp = 25;
        xcplin1 = 0;
        xcplin2 = 18;
        ycplin = 4;
        xwndshldcp = -1000;
        ywndshldcp = 1102;
        xupwhl1cp = -1000;
        yupwhl1cp = -1000;
        rxupwhl1cp = -1000;
        yupwhl2cp = -1003;
        xupwhl2cp = -1000;
        tpcpsz = 0;
        
    } if (followS && subCar.yPos>yPoscp+10){  
      
     if (followS && subCar.yPos>yPoscp+16){
      yPoscp = yPoscp + spdcp;
      bodcpx = 20;        //when s is pressed, x length of the car body becomes 20
      bodcpy = -30;       //when s is pressed, y length of the car body becomes 30
      lwhlxcp =  -10000;     // left wheel goes off screen
      rwhlxcp = -10000;      // right wheel goes off screen
      xcplin1 = -10000;    // line 1 goes off screen
      xcplin2= -10000;     // line 2 goes off screen
      ycplin = -10000;
      xwndshldcp = 1;       //windshield x pos goes to 1
      ywndshldcp = 11;      //windshield y pos goes to 11
      xupwhl1cp = 0;        //x wheel pos goes to 0
      yupwhl1cp = -6;       // whl 1 moves to y = -6 from pos
      rxupwhl1cp = 20;      // whl 1 moves to x = 20 from pos
      yupwhl2cp = -23;      // wheel 2 moves up 23
      xupwhl2cp = 20;       // wheel 2 moves right 20
      tpcpsz = -9; 
    } else {
        bodcpx = 30;
        bodcpy = 10;
        lwhlxcp = 5;
        rwhlxcp = 25;
        xcplin1 = 0;
        xcplin2 = 18;
        ycplin = 4;
        xwndshldcp = -1111;
        ywndshldcp = 1000;
        xupwhl1cp = -1000;
        yupwhl1cp = -1000;
        rxupwhl1cp = -1000;
        yupwhl2cp = -1003;
        xupwhl2cp = -1000;
        tpcpsz = 0;
    } 

   }

 }

    

  void cpd() {                           //when follow d is true, the cop can follow right
    followD = true;
  }

  void cpa() {                          //when follow a is true, the cop can follow left
    followA = true;
  }
  
  void cpw() {                          //when follow w is true, the cop can follow upwards
    followW = true;
  }
  
  void cps() {                          //when follow s is true, the cop can follow downwards
    followS = true;
  }
  
  
//void hitbox(){                            //hitbox of cop
//   ellipse(tempx, tempy, l, w);
//}
  
}
