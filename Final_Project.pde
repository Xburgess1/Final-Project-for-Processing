//holds the information for the car that drives across the screen
PImage car;

//holds the information for the X location of the car
float carX = 2600;

//holds the information for the explosion
PImage explosion;

//boolean variable for if the nuke huts the ground
boolean nukeHits = false;

//boolean variable for buttons showing up
boolean buttons = true;

//holds the information for the "Nuke" button
String nukeIncomming = "Nuke incomming";

//plane's X position
float planeX = 3000;

//boolean variable for if the nuke will be dropped
boolean startNuke = false;

//holds the information for the nuke
PImage nuke;

//sets the nukes y location
int nukeY = 50;

//reset button shows up
boolean end = false;

//holds the information for the DVD's x location
float dvdX = -100;
//holds the information for the DVD's Y location
float dvdY = 200;

//moves the DVD on the X axis
float moveDVDX = 4.6;
//moves the DVD on the Y axis
float moveDVDY = 3.4;

//boolean variable for if the DVD button was pressed
boolean dvdEnters = false;


//holds the information for the DVD image
PImage DVD;

//holds the information for the speed of the car
float moveCarX = -1;


void setup()
{
  //sets the size of the screen
  size(2400,1600);
  
  
  //loads the image for the car
  car = loadImage("car-png-2.png");
  
  //loads the image for the explosion
  explosion = loadImage("explosion.png");
  
  //loads the image for the nuke
  nuke = loadImage("nuke.png");
  
  //loads the image for the DVD
  DVD = loadImage("DVD.png");
  
  
  //sets the smooth to make the lines not as choppy
  smooth();
}

void draw()
{
  //sets the stroke weight
  strokeWeight(1);
  
  //sets the background to sky blue
  background(135,206,235);
  
  //set the rect mode to center
  rectMode(CENTER);
  
  //sets the stroke weight to 10
  strokeWeight(15);
  
  
  //makes the body of the building in the middle
  fill(169,169,169);
  rect(1200,1200,500,1500);
  
  //makes the windows on the building
  //fills the windows with the blue colour
  fill(30,144,255);
  rect(1050,600,110,110);
  rect(1350,600,110,110);
  rect(1050,800,110,110);
  rect(1350,800,110,110);
  rect(1050,1000,110,110);
  rect(1350,1000,110,110);
  rect(1050,1200,110,110);
  rect(1350,1200,110,110);
  
  //draws the door on the building
  //fills the door with the brown colour
  fill(165,42,42);
  rect(1200,1500,150,200);
  
  
  //sets the image mode to corner
  imageMode(CORNER);
  
  
  //sets the location of the car and the size of the car
  image(car,carX,1475,300,160);
  
  //moves the car across the screen
  carX = carX + moveCarX;
  
  //if the carX reaches -300 it resets
  if (carX <= -300)
  {
    carX = 2600;
  }
  
  //if the carX reaches 2700 it resets to -200
  if (carX >= 2700)
  {
    carX = -200;
  }
  
  
  //if the nuke hits the ground the explosion appears
  if(nukeHits == true)
  {
    //sets the image mode to corner
    imageMode(CORNER);
    //sets the location and size for the explosion
    image(explosion,245,-70,2000,2000);
  }
  
  //draws the nuke button at the top of the screen
  if(buttons == true)
  {
    //sets the stroke weight to 5
    strokeWeight(5);
    //fills the colour of the button with white
    fill(255);
    //body of the buttons
    rect(2000,150,350,150);
    //fills the text colour to black
    fill(0);
    //sets the text size and the text
    textSize(35);
    text("Nuke",1950,175);
  }
  
  //if the start nuke variable is true the plane starts to move
  if(startNuke == true)
  {
    //fills the plane colour with black
    fill(0);
    //draws the plane
    ellipse(planeX,0,500,130);
    //moves the plane to the left
    planeX = planeX - 2.5;
  }
  
  //if the plane reaches over right over the building the nuke drops
  if(planeX <= width/2)
  {
    //makes the image of the nuke on the screen
    image(nuke,1200,nukeY,100,90);
    //moves the nuke down
    nukeY = nukeY +5;
  }
  
  //if the nuke hits it blows up
  if(nukeY >= 1580)
  {
    //draws the reset button
    fill(255);
    rect(300,1000,350,150);
    //draws the reset text 
    fill(0);
    text("Reset",250,1020);
    //shows the explosion of the nuke and the reset button
    nukeHits = true;
    end = true;
  }
  
  
  //draws the Nostalgia button at the top of the screen
  if(buttons == true)
  {
    //sets the stroke weight to 5
    strokeWeight(5);
    //fills the colour of the button with white
    fill(255);
    //body of the buttons
    rect(400,150,350,150);
    //fills the text colour to black
    fill(0);
    //sets the text size and the text
    textSize(35);
    text("Nostalgia",320,175);
  }
  
  //if the DVD button is pressed a DVD enters the screen
  if(dvdEnters == true)
  {
    //sets the image mode to center
    imageMode(CENTER);
    //draws the DVD on the screen
    image(DVD,dvdX, dvdY,300,300);
    //moves the DVD on the X axis
    dvdX = dvdX + moveDVDX;
    //moves the DVD on the Y axis
    dvdY = dvdY + moveDVDY;
    //draws the reset button
    fill(255);
    rect(300,1000,350,150);
    //draws the reset text 
    fill(0);
    text("Reset",250,1020);
    //allows for the reset button to be pressed
    end = true;
  }
  
  
  //if the DVD hits the right hand if the screen it bounces back
  if(dvdX > width)
  {
    dvdX = width;
    moveDVDX = -moveDVDX;
  }
  
  //if the DVD hits the laft sideof the screen it bounces back
  if(dvdX < 0)
  {
    dvdX = 0;
    moveDVDX = -moveDVDX;
  }
  
  //if the DVD hits the bottom of the screen it bounces back
  if(dvdY > height)
  {
    dvdY = height;
    moveDVDY = -moveDVDY;
  }
  
  //if the DVD hits the top of the screen it bounces back
  if(dvdY < 0)
  {
    dvdY = 0;
    moveDVDY = - moveDVDY;
  }
  
  
  //Draws the exit button in the middle of the screen
  if(buttons == true)
  {
    //sets the stroke weight to 5
    strokeWeight(5);
    //fills the colour of the button with white
    fill(255);
    //body of the buttons
    rect(width/2,150,350,150);
    //fills the text colour to black
    fill(0);
    //sets the text size and the text
    textSize(35);
    text("Exit",1150,175);
  }
  
  
  //sets the text size to 40
  textSize(40);
  //draws the text that says what buttons to press on the screen
  text("Press 'a' and 's' to\n speed up and slow down car",1600,height/2);
}

void mousePressed()
{
  //if nuke button is pressed the nuke starts
  if(buttons == true && mouseX >= 1825 && mouseX <= 2175 && mouseY >= 75 && mouseY <= 225)
  {
    //turns the buttons variable to false which makes all buttons disappear
    buttons = false;
    //prints "Nuke incomming in the console
    println(nukeIncomming);
    //turns the start nuke variable to true
    startNuke = true;
  }
  
  
  //if the reset button is pressed it resets everything to the beginning
  if(end == true && mouseX >= 125 && mouseX <= 475 && mouseY >= 925 && mouseY <= 1075)
  {
    //makes the reset button disapear
    end = false;
    //makes the original buttons appear
    buttons = true;
    //makes the explosion disapear
    nukeHits = false;
    //makes the plane stop moving
    startNuke = false;
    //sets the plane back to original position
    planeX = 3000;
    //sets the bomb back to original position
    nukeY = 50;
    //stops the ball from moving
    dvdEnters = false;
    //sets the ball X location back to original
    dvdX = -100;
    //sets the ball Y location back to original
    dvdY = 200;
  }
  
  
  //if the DVD button is pressed
  if(buttons == true && mouseX >= 225 && mouseX <= 575 && mouseY >= 75 && mouseY <= 225)
  {
    //makes the buttons disapear
    buttons = false;
    //makes the DVD start moving
    dvdEnters = true;
  }
  
  
  //if the exit button is pressed the window closes
  if(buttons == true && mouseX >= 1025 && mouseX <= 1375 && mouseY >= 75 && mouseY <= 225)
  {
    //exits the window
    exit();
  }
}

void keyPressed()
{
  //if the 'a' key is pressed the car speeds up
  if(key == 'a')
  {
    moveCarX = moveCarX -0.5;
  }
  
  //if the 's' key is pressed the car speeds up
  if(key == 's')
  {
    moveCarX = moveCarX +0.5;
  }
}


/**
  *1)  My four (or more) text, images, and/or shapes are:
    The building which is made up of 10 rectangles, the four buttons, the plane, the nuke,
    the explosion and the DVD symbol

  *2)  My one (or more) self-taught animation is/are (PLEASE INCLUDE LINKS):
    my self taught animation is the DVD symbol move and bounce on the sides of the wall, link: https://funprogramming.org/15-Ball-bouncing-at-the-window-borders.html
    its not an animation but i also taught myself how to make a button that exits the window link: https://processing.org/reference/exit_.html
    
  *3)  My four (or more) animations that were not learned from online tutorials are: the car moving across the bottom of the screen, the plane flying over the top of
    the building, the nuke falling from the plane, making the buttons appear and disappear and making the car speed up or slow down depending on how much you click

  *4)  When you press the ____ key, this happens: when you press the 'a' key the car speeds up and when you press the 's' key the car slows down

  *5)  When you click the ____, this happens: depending on what button you press some action will happen either the DVD bouncing on the screen, or the plane flying
  over and dropping the bomb, or being able to exit the window
 */
