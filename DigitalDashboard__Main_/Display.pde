class Display{
  
  String units = "";
  String currentValue = "";
  String displayName = "";
  
  
  void Display(float x, float y, String a, String b, String c)
 {
   units = a;
   currentValue = b;
   displayName = c;
   
   textFont(DisplayFont);
   fill(80);
   rect(x,y,650,50);
   fill(255);
   text(a,x+33,y+33);
   fill(80);
   rect(x+670, y, 200, 50);
   fill(0, 202, 270);
   rect(x+850, y, 10, 50);
   fill(255);
   text(b, x+675, y+33);
   text(c, x+800, y+33);
 }
  
}
