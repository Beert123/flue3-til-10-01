ArrayList<Flue> flueListe = new ArrayList<Flue>();

void setup(){
  size(500,500);
}

void draw(){
  // Her laves fluerne fra listen samt bliver de forskellige funktioner kørt
  for(int i=0; i<flueListe.size(); i++){
    Flue f = flueListe.get(i);
    f.tegnFlue();
    f.flyt();
  }
}

void keyPressed(){
  //når i dette tilfælde e bliver tastet laver det en ny flue i listen. parameterne beskriver bl.a. fluens posistion hvor 2 beskriver dens "bigness"
  flueListe.add(new Flue());
  if(key =='e'){
 translate(width/2,height/2);
 flueListe.add(new Flue(random (width), random (height),2));
 
  }
}

void mousePressed(){
  //her laver programmet en flue når man kligger med musen
  flueListe.add(new Flue(mouseX, mouseY,1));
}

/////////////////////////////////////////////////////////
class Flue{
  //dette er en klasse som beskriverfluens posistion samt hvordan den roterer
  float positionX,positionY;
  float distanceFlyttet;
  float vinkel = 0; 
  float bigness;
  float speed = 0.5;
  
  Flue(){
    positionX  = random(0,height);
    positionY  = random(0,width);
    vinkel     = random(0,2*PI);
  }
  
  Flue(float a, float b, float c){
    //her er fluens parametre siden i "keypressed" blev sat tre argumenter op som hver beskriver fluens position og dens scale/hvor stor den er.
    positionX = a;
    positionY = b;
    bigness = c;
    vinkel    = random(0,2*PI);
  }
  
  void flyt(){
    distanceFlyttet = distanceFlyttet + speed;
    
   float flueHojde = positionY + sin(vinkel) * distanceFlyttet;
   float flueLongde = positionX + cos(vinkel) * distanceFlyttet;
   if(flueHojde >=height || flueHojde <0){
    println("yikes"); 
    speed = -speed;
   }
   if(flueLongde >=width || flueLongde <0){
    println("yikes2"); 
    speed = -speed;
   }
    }

  void tegnFlue(){
    pushMatrix();
      translate(positionX,positionY);
      rotate(vinkel);
      translate(distanceFlyttet,0);
      scale(bigness);
        ellipse(0,0,20,8);
        ellipse(0,0-8,15,10);
        ellipse(0,0+8,15,10);
        ellipse(0+6,0,8,8);
    popMatrix();
  } 
  
}
 
