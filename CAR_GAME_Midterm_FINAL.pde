//Joseph Accurso



CopCar dirtypig = new CopCar();
Car player1 = new Car();
Car player2 = new Car();




ArrayList<CopCar> Fleet = new ArrayList<CopCar>();     // an array list called fleet of new cop cars

Boost[] boosts = new Boost[4];                         // an array of 4 boost pannels
Mud[] spots = new Mud[6];                              //an array of 6 mud splats



void setup() {
  //window modifications
  size(1000, 800);
  background(255);


  //shape properties
  noStroke();
  fill(0, 0, 255);


  for (int i=0; i < boosts.length; i++) {                 //initalizes boost pannels
    boosts[i]= new Boost();                               //for every i boosts, a new Boost is created
  }
  
  for (int k=0; k < spots.length; k++){                   //initializes mud spots
    spots[k]= new Mud();                                  //for every k spots, a new Mud is created
  }
  
  
  
}

void draw() {
  int r = 250;                                            //int r is very red
  int g = 250;                                            //int g is very green

  //wipe
  background(0, 100, 100);

  for (int k=0; k < spots.length; k++){                   // array list k starts at 0 and goes through the length of spots at a rate of 1
    spots[k].spill();                                     // for each spots, a mud spot is spilled
  }

  for (int i=0; i < boosts.length; i++) {                 //array list i starts at 0 and goes through the length of boosts at a rate of 1
    boosts[i].place();                                    // for each boosts, a boost pannel is placed
  }

  //player1.hitbox(player1.xPos, player1.yPos);           //replica of the player 1 hitbox
  //player2.hitbox(player2.xPos, player2.yPos);          //replica of the player 2 hitbox
  //dirtypig.hitbox();


  //COP CAR
  dirtypig.show(player1);

  dirtypig.cpd();             //draw when cpd is true
  dirtypig.cpa();
  dirtypig.cps();
  dirtypig.cpw();

  for (CopCar copCar : Fleet) {        // copCar is a CopCar and it returns array list fleet as a cop car
    copCar.show(player1);
    copCar.cpd();
    copCar.cpa();
    copCar.cps();
    copCar.cpw();
  }




  //Booststststs
  for (int i=0; i< boosts.length; i++) {
    if (player1.xPos>boosts[i].boostx && player1.xPos < boosts[i].boostx+38 && player1.yPos < boosts[i].boosty+22 && player1.yPos>boosts[i].boosty) {
        player1.increase();
    } //else {
       // player1.stopincrease();
    //}
    if ( player2.xPos < boosts[i].boostx+38 && player2.xPos>boosts[i].boostx && player2.yPos < boosts[i].boosty+22 && player2.yPos>boosts[i].boosty) {
      player2.increase();
    } //else {
      //player2.stopincrease();
    //}
  }
  
  //Mud Spots
  for (int k=0; k< spots.length; k++) {
    if (player1.xPos>spots[k].mudx && player1.xPos < spots[k].mudx+20 && player1.yPos < spots[k].mudy+20 && player1.yPos>spots[k].mudy){
        player1.decrease();
    }
    if (player2.xPos>spots[k].mudx && player2.xPos < spots[k].mudx+20 && player2.yPos < spots[k].mudy+20 && player2.yPos>spots[k].mudy){
        player2.decrease();
    }
  }

  //TIME

  if (frameCount % 1200 == 0) {      //for every multiple of 1200 it spawns
    Fleet.add(new CopCar());
  }

  if (frameCount/60 < 90 && r<=250) {
    r = r--;
    g = 0;
  }

  if (frameCount/60 > 90 && g<=250) {
    r = 0;
    g = g--;
  }
  fill(r, g, 0);

  textSize(30);
  text(frameCount/60, 25, 40);
  
  
  player1.display();
  player2.display();
  
}


void keyPressed() {
  //player1 CONTROLS
  if (key == 'a') {       // if a is pressed, boolean left will be true, and the x coordinate will decreased
    player1.a();
  }
  if (key == 'd') {        // if d is pressed, it will move right
    player1.d();
  }
  if (key == 'w') {      // if w is pressed, it will move up and the car will look different
    player1.w();
  }
  if (key == 's') {       // if s is pressed, it will move down and the car will look different
    player1.s();
  }


  
  //player2 CPNTROLS
  if (key == CODED) {              //allows up down lef and right to be key commands
    if (keyCode == UP) {           // if up arrow is pressed, w will be done for p2, making it go up 
      player2.w(); 
    }
    if (keyCode == DOWN) {         
      player2.s();
    }
    if (keyCode == LEFT) {         //if left arrow is pressed, a will be done for p2, making it go left
      player2.a();
    }
    if (keyCode == RIGHT) {
      player2.d();
    }
  }
}

void keyReleased() {
  //player1 CONTROLS
  if (key == 'a') {       // if a is released, it will stop moving left
    player1.aReleased();
  }
  if (key == 'd') {        // if d is released, it will stop moving right
    player1.dReleased();
  }
  if (key == 'w') {       // if w is released, it will stop moving and the car will look the same as before
    player1.wReleased();
  }
  if (key == 's') {      // if s is released, it will stop moving and the car will look the same as before
    player1.sReleased();
  } 


  //player2 CPNTROLS
  if (key == CODED) {
    if (keyCode == UP) {
      player2.wReleased();
    }
    if (keyCode == DOWN) {      //if down arrow is released, sReleased will happen, causing the movement to stop
      player2.sReleased();
    }
    if (keyCode == LEFT) {
      player2.aReleased();
    }
    if (keyCode == RIGHT) {     //if right arrow is released, dReleased will happen, causing the movement to stop
      player2.dReleased();
    }
  }
}
