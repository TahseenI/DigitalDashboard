class Gauge 
{
  float Maximum = 0;
  float Minimum = 0;
  float CurrentValue = 0;
  String Units = "";

  Gauge(String unit) 
  { //Loads maximum value and units into the guage
    
    Units = unit;
  }
  Gauge() {
  }

  void display(int x, int y, float input) 
  {
    
    if(input<=Maximum && input >= Minimum){
    CurrentValue = input;
    }
    float ratio = CurrentValue / Maximum;
    noFill();
    stroke(255);
    strokeWeight(30);
    arc(x, y, 375, 375, 0, TWO_PI);
    stroke(80);
    strokeWeight(10);
    arc(x, y, 400, 400, 0, TWO_PI);
    stroke(120);
    strokeWeight(15);
    arc(x, y, 420, 420, HALF_PI+QUARTER_PI, (TWO_PI+QUARTER_PI));

    
    
    
    
    if(CurrentValue <= ((Maximum - Minimum) * 0.15)){
      stroke(255,255,0);
    }
    else if(CurrentValue >= (Maximum - Minimum) - ((Maximum - Minimum) * 0.15)){
      stroke(225,127,80);
    }else{
      stroke(0, 202, 270);
    }
    
    strokeWeight(15);

    float textWidth = 0;
    float textWidth1 = 0;
    float radianRatio = (TWO_PI - HALF_PI)*(1-ratio);

    arc(x, y, 420, 420, HALF_PI+QUARTER_PI, (TWO_PI+QUARTER_PI) - radianRatio);

    noStroke();
    
    fill(140);
    rect(x-225,y+125,100,50);
    rect(x+125,y+125,100,50);
    fill(100);
    rect(x-225,y+125,100,10);
    rect(x+125,y+125,100,10);
    fill(0, 202, 270);
    rect(x-225,y+120,100,5);
    rect(x+125,y+120,100,5);
    fill(191, 191, 191);
    quad(x+125, y+100, x-125, y+100, x-175, y+205, x+175, y+205);
    textFont(SmallFont);
    fill(255);
    text("Min", x-210, y+140);
    text("Max", x+170, y+140);
    text(nfs(Minimum,0,0), x-220, y+165);
    text(nfs(Maximum,0,0), x+145, y+165);
    textSize(100);





    fill(0, 202, 273);
    textFont(trench);
    String k = nfs(input, 0, 2);
    textWidth1 = textWidth(k)+15;
    text(k, x-(textWidth1/2), y+20);
    fill(50, 50, 50);
    textFont(Adonix);
    String r = Units;
    textWidth = textWidth(r);

    text(Units, x-(textWidth/2), y+175);

    fill(60, 60, 60);
  }
  void setMax(float a){
    Maximum = a;
    
    
  }
  void directionDisplay(int x, int y, String a) 
  {
    fill(0, 202, 270);
    textFont(Adonix);
    text(a, x-textWidth(a)/2, y+textAscent()/2);
    noFill();
    stroke(220);
    arc(x,y,150,150,0,TWO_PI);
    stroke(150);
    arc(x,y,150,150,QUARTER_PI/2 + 0, HALF_PI - QUARTER_PI/2 + 0);
    arc(x,y,150,150,QUARTER_PI/2 + HALF_PI, HALF_PI - QUARTER_PI/2 + HALF_PI);
    arc(x,y,150,150,QUARTER_PI/2 + PI, HALF_PI - QUARTER_PI/2 + PI);
    arc(x,y,150,150,QUARTER_PI/2 + PI + HALF_PI, HALF_PI - QUARTER_PI/2 + PI + HALF_PI);
    stroke(255);
    arc(x,y,150,150,QUARTER_PI+QUARTER_PI/2, HALF_PI + QUARTER_PI - QUARTER_PI/2);
    arc(x,y,150,150, HALF_PI + QUARTER_PI+QUARTER_PI/2, HALF_PI + HALF_PI + QUARTER_PI - QUARTER_PI/2);
    arc(x,y,150,150,PI + QUARTER_PI+QUARTER_PI/2, PI + HALF_PI + QUARTER_PI - QUARTER_PI/2);
    arc(x,y,150,150,PI + HALF_PI + QUARTER_PI+QUARTER_PI/2, PI + HALF_PI + HALF_PI + QUARTER_PI - QUARTER_PI/2);
    
    if(a.equals("SE")){
      stroke(0, 202, 270);
      arc(x,y,150,150,QUARTER_PI/2 - 0, HALF_PI - QUARTER_PI/2 + 0);
      
    }else if(a.equals("SW")){
      stroke(0, 202, 270);
      arc(x,y,150,150,QUARTER_PI/2 + HALF_PI, HALF_PI - QUARTER_PI/2 + HALF_PI);
    }else if(a.equals("NW")){
      stroke(0, 202, 270);
      arc(x,y,150,150,QUARTER_PI/2 + PI, HALF_PI - QUARTER_PI/2 + PI);
    }else if(a.equals("NE")){
      stroke(0, 202, 270);
      arc(x,y,150,150,QUARTER_PI/2 + PI + HALF_PI, HALF_PI - QUARTER_PI/2 + PI + HALF_PI);
    }else if(a.equals("S")){
      stroke(0, 202, 270);
      arc(x,y,150,150,QUARTER_PI+QUARTER_PI/2, HALF_PI + QUARTER_PI - QUARTER_PI/2);
    }else if(a.equals("W")){
      stroke(0, 202, 270);
      arc(x,y,150,150, HALF_PI + QUARTER_PI+QUARTER_PI/2, HALF_PI + HALF_PI + QUARTER_PI - QUARTER_PI/2);
    }else if(a.equals("N")){
      stroke(0, 202, 270);
      arc(x,y,150,150,PI + QUARTER_PI+QUARTER_PI/2, PI + HALF_PI + QUARTER_PI - QUARTER_PI/2);
    }else if(a.equals("E")){
      stroke(0, 202, 270);
      arc(x,y,150,150,PI + HALF_PI + QUARTER_PI+QUARTER_PI/2, PI + HALF_PI + HALF_PI + QUARTER_PI - QUARTER_PI/2);
    }
    
    
    
    noStroke();
    
    
  }
}
