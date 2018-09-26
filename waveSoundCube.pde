// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/IKB1hWWedMk
// Modifed by Palle Torsson for Programming for Artist 2018

import processing.sound.*;
Amplitude amp;
SoundFile file;



Kvadrat kvadrat1;
Kvadrat kvadrat2;
Kvadrat kvadrat3;
Kvadrat kvadrat4;
Kvadrat kvadrat5;
Kvadrat kvadrat6;


void setup() {
  size(displayWidth, displayHeight, P3D);
  kvadrat1 = new Kvadrat(6, 600, 600, (displayWidth/2), (displayHeight/2), 150, 0, 0, 0);  
  kvadrat2 = new Kvadrat(6, 600, 600, 300, 300, 594, 0, 90, 0);
  kvadrat3 = new Kvadrat(6, 600, 600, -294, 300, 594, 0, 180, 0);  
  kvadrat4 = new Kvadrat(6, 600, 600, -294, 300, 0, 0, -90, 0);
  kvadrat5 = new Kvadrat(6, 600, 600, 300, -294, 0, 90, 0, 0);  
  kvadrat6 = new Kvadrat(6, 600, 600, 300, -294, 594, 180, 0, 0);

  amp = new Amplitude(this);
  file = new SoundFile(this, "Moderat.wav");
  file.play();
  amp.input(file);
  //smooth();
}

void draw() {

  background(0);

  // move the center of rotation 
  // to the center of the sketch
  //translate(width/2, height/2);

  // rotate around the center of the sketch
  translate(displayWidth/4,displayHeight/5,-200);
  rotateX(radians((mouseY/6)-(displayHeight)));
  rotateY(radians((mouseX/6)+(displayWidth)));


  
  kvadrat1.run(); 
  kvadrat2.run(); 
  kvadrat3.run(); 
  kvadrat4.run(); 
  kvadrat5.run(); 
  kvadrat6.run();
  

}
