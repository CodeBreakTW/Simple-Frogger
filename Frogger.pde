import java.util.*;
Random rand = new Random();
float carsx[] = new float[16];
color colors[] = new color[16];
int level = 1;
float win_count = 1;
boolean isHeld = false;
boolean win = false; 
float playerx = 200;
float playery = 350;
int player_width = 20;
int player_height = 20;
int sec = 400;
int lives = 3;
boolean restart = false; 
boolean gameOver = false;
PFont livesFont;

void setup() {
  
  for(int c = 0; c < 16; c++){
    colors[c] = color(rand.nextInt(255),rand.nextInt(255),rand.nextInt(255)) ;
  }

  size(400, 400);
  carsx[0] = 0;
  carsx[1] = 100;
  carsx[2] = 200;
  carsx[3] = 300;
  carsx[4] = 400;
  carsx[5] = 0;
  carsx[6] = 100;
  carsx[7] = 200;
  carsx[8] = 300;
  carsx[9] = 400;
  carsx[10] = 0;
  carsx[11] = 100;
  carsx[12] = 200;
  carsx[13] = 300;
  carsx[14] = 400;
  carsx[15] = 0;
  


  livesFont = createFont("Arial Bold", 18);

}

void draw() {
 gameOver();
 if(restart == false) {
  background(40, 200, 40);
  fill(0, 0, 255);
  ellipse(width/2, 0, 400, 100);
  fill(255);
  textAlign(CENTER);
  textSize(16);
  textFont(livesFont);
  text("Lives: " + lives, width/2, 30); 
  textAlign(LEFT);
  text("LEVEL: " + level, 10, 30); 
  textAlign(CENTER);
  fill(200);
  rect(-1, 250, 401, 60);
  rect(-1, 100, 401, 60);
  ellipse(playerx, playery, player_width, player_height);

  lineDraw();

  carDraw();
 
  if(playery >400) {
    playery = 400;
  }
  if(playery < 0) {
    playery = 0;
  }
  if(playerx > 400) {
    playerx = 400;
  }
  if(playerx < 0) {
    playerx = 0;
  }

 }
if(gameOver== true){
  background(40, 200, 40);
  textAlign(CENTER);
  textSize(72);
  textFont(livesFont);
  fill(255);
  text("GAME OVER! Press r to restart!", width/2, height/2);

 }
if(win == true) {
  background(40, 200, 40);
  textAlign(CENTER);
  textSize(72);
  textFont(livesFont);
  fill(255);
  text("YOU WIN, CONGRATS! Press r to restart!", width/2, height/2);
  playerx = 200;
  playery = 350;

}

if(restart == true) { 
    gameOver =  false; 
    win = false; 
    lives = 3; 
    restart = false; 
} 
 

}


void lineDraw() {
  int linedraw = 0;

  while(linedraw < 400) {
    
    line(linedraw, 130, linedraw +3, 130);
    line(linedraw, 280, linedraw +3, 280);
    fill(40, 200, 40);


    linedraw += 10; 
    }
  
}


void carDraw() {
  int y; 
  float speed;
  int delay;
  fill(255);
  for(int i = 0; i < 16; i++) {
    if(i < 3) {
      fill(colors[i]);
      y = 110;
      speed = 2.3 * win_count;
      delay = 0;
    }
    else if(i < 7){
      fill(colors[i]);
      y = 135;
      speed = 2.7 * win_count;
      delay = 0;
    }
    else if(i < 11) {
      fill(colors[i]);
      y= 260;
      speed = 3*win_count;
      delay = 0;
    }
    else {
      fill(colors[i]);
      y = 285;
      delay = 0;
      speed = 1.9*win_count;
    }
    rect(carsx[i] - delay, y, 30, 20);
    if(carsx[i] < 460 + delay){
      carsx[i] += speed;
    }
    else{carsx[i] = -30 - delay;}
    
    if(playerx < carsx[i] -delay + 30 && playery < y + 25 && playerx + player_width > carsx[i] - delay 
    && playery + player_height > y){
      lives -= 1; 
      playerx = 200;
      playery = 350;

    }
  }
  
}



void keyPressed() {

  if(isHeld == false) {
    if(keyCode == UP) {
      playery -= 30;
    } else if(keyCode == DOWN) {
      playery += 30;
    } else if(keyCode == LEFT) {
      playerx -= 15;
    } else if(keyCode == RIGHT) {
      playerx += 15;
    }
    isHeld = true;
  }
  if(gameOver == true || win == true) {
    if(key == 'r') {
       restart = true; 
       
    }
  }
}
void keyReleased() {
  isHeld = false;
}

void gameOver() {
   if(lives == 0) {
     gameOver = true; 
     win_count = 1;
     level = 1;
     playerx = 200;
     playery = 350;
   }
   if(playery < 50){
     win = true;
     win_count +=.25;
     level += 1;
   } 
}
