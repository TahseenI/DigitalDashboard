//build 2.0.0: Final Product for Inspection //<>// //<>// //<>//

import org.gicentre.utils.stat.*;
//declaration of classes
SensorDataProvider data = new SensorDataProvider();
Car vehicle = new Car();

Gauge fuel = new Gauge("Liters");
Gauge RPM = new Gauge("RPM");
Gauge Speed = new Gauge("km/hr");
Gauge direction = new Gauge();
Display FuelEcon = new Display();
Display FuelCons = new Display();
Display Range = new Display();
Display Odometer = new Display();
Display FuelEconomy = new Display();
String buildversion = "2.0.0";
boolean FernandoMode = false; //This is a mode developed to satisfy max and min based on csv files
boolean bootup = false;
boolean startup = true;
boolean resetmenu = false;
String vehicletype = "";
PFont trench;
PFont Adonix;
PFont SmallFont;
PFont MedFont;
PFont DisplayFont;
String time;
int s; 
int m;  
int colorz = 24;
int colorz2 = 102;
int colorz3 = 173;
int h;
float textWidthReset = 0;
float textWidthMenu = 0;
int counter;
PImage img;
float animationx;
float animationx2;
int xcounter = 0;
int xcounterarc = 0;
String displayMessage = "Application Loading...";
PFont SuperSmallFont;



void setup() 
{
  fullScreen();
  img = loadImage("Capture.PNG");
  //size(1920,1080);
  
  animationx = 3*height/5;
  animationx2 = height;
  background(40);
  trench = createFont("Azonix", 60);
  Adonix = createFont("Azonix", 50);
  SmallFont = createFont("Azonix", 20);
  MedFont = createFont("Azonix", 35);
  DisplayFont = createFont("Azonix",25);
  SuperSmallFont = createFont("Azonix", 5);
}

void draw() 
{
  s = second();
  m = minute();
  h = hour();

  time = nfs(h, 2, 0) + ":" + nfs(m, 2, 0) + ":" + nfs(s, 2, 0);
  
  if (startup) 
  { 
    if (bootup) 
    {
      printMenu(); //displays the choice of BMW and Truck or exit program
    } 
    else 
    { 
      printBoot(); //bootup animation
    }
  } 
  
  else 
  {

    if (resetmenu) 
    {

      textFont(SmallFont);
      textWidthReset = textWidth("Hit [M] to go back to menu");
      textWidthMenu = textWidth("Hit [E] to exit program");
      fill(200);
      rect(width/3,4*height/5,width/3, height/7);
      fill(160);
      rect(width/3+20,4*height/5+20,width/3-40, height/7-40);
      fill(0, 202, 270);
      rect(1.9*width/3,4*height/5,20, height/7);
      
      fill(255);
      text("Hit [M] to go back to menu", width/2 - textWidthReset/2, 8.5*height/10);
      text("Hit [E] to exit program", width/2 - textWidthMenu/2, 9*height/10);
      if (keyPressed) 
      {
        if (key == 'M' || key == 'm') 
        {
          resetmenu = false;
          startup = true;
          data.currentIndex = 0;
          vehicle.trip.totalDistance = 0;
          
          for(int i = vehicle.fuel.fuelEconomy.size(); i > 0; i--)
          vehicle.fuel.fuelEconomy.remove(0);
          
          for(int i = vehicle.fuel.fuelEconomyHistory.size(); i > 0; i--)
          vehicle.fuel.fuelEconomyHistory.remove(0);
          
          for(int i = vehicle.fuel.consumptionHistory.size(); i > 0; i--)
          vehicle.fuel.consumptionHistory.remove(0);
        }
      } 
      else if (key == 'E' || key == 'e') 
      {
        exit();
      }
    } 
    else 
    {

      if (keyPressed) 
      {
        if (key == 'M' || key == 'm') 
        {
          resetmenu = false;
          startup = true;
          data.currentIndex = 0;
          vehicle.trip.totalDistance = 0;
          for(int i = vehicle.fuel.fuelEconomy.size(); i > 0; i--)
          vehicle.fuel.fuelEconomy.remove(0);
          
          for(int i = vehicle.fuel.fuelEconomyHistory.size(); i > 0; i--)
          vehicle.fuel.fuelEconomyHistory.remove(0);
          
          for(int i = vehicle.fuel.consumptionHistory.size(); i > 0; i--)
          vehicle.fuel.consumptionHistory.remove(0);
          
          
          
        }
      } 
      else 
      {
        background(40);

        vehicle.processInput();

        fuel.display(Center(3, 0), height/2, vehicle.tank.fuelLevel);
        Speed.display(Center(3, 1), height/2, vehicle.trip.currentSpeed * 3.6); //1 m/s = 3.6km/hr
        RPM.display(Center(3, 2), height/2, data.getRPM());
        direction.directionDisplay(width/2, height/5 - 50, vehicle.trip.direction);

        fill(255);
        textFont(Adonix);
        text(vehicletype, width/20, height/10);
        textFont(MedFont);
        text("Hold [M] to return to Menu", 13*width/20, height/15);
        textFont(Adonix);

        //this is how the total distance updates itself (distance in a single second is the same as the speed in that second)
        fill(200);
        rect(width/30, 2.8*height/4 , width - 2*width/30, height/3.5);
        //fuel economy related updates
        vehicle.fuel.calculateEconomy(vehicle.trip.currentSpeed / 1000, vehicle.tank.consumedFuel, data.currentIndex);

        //("Time: " + data.currentIndex + "Speed: " + vehicle.getCurrentSpeed() + " m/s, Distance: " + vehicle.totalDistance + "m");
        //text("Odometer: " + nfs(vehicle.trip.totalDistance / 1000, 0, 2) + "Km", width/3 + 25, height/3 - 125);
        textSize(25);
        //text("Fuel Consumed in the last second: " + vehicle.tank.getConsumedFuel(vehicle.tank.fuelLevel, vehicle.tank.previousLevel) + " L", width/3 + 30, height/3 + 600);
        //text("Fuel Consumption: " + vehicle.fuel.calculateConsumption() + " L/100km", (width/3), height/3 + 545);
        //text("Current range: " + nfs(vehicle.fuel.getRange(vehicle.tank.fuelLevel) / 1000, 0, 2) + " Km", width/3 + 50, height/3 - 50);
        
        
        FuelEcon.Display(width/30+20,770, "Fuel Consumed in the last second:", nfs(vehicle.tank.consumedFuel, 0,4), "L" );
        FuelCons.Display(width/30+20,830, "Fuel Consumption (per 100KM)", nfs(vehicle.fuel.consumption, 0,2), "L" );
        Range.Display(width/30+20,890, "Current Range:", nfs(vehicle.fuel.range, 0, 2), "KM" );
        Odometer.Display(width/30+20,950, "Odometer:", nfs(vehicle.trip.totalDistance / 1000, 0, 2), "KM" );
        textSize(5);
        fill(255,255,255);
        drawGraph(vehicle.fuel.fuelEconomyHistory, 1000, 800, "Fuel Economy");
        drawGraph(vehicle.fuel.consumptionHistory, 1440, 800, "Consumption History");
        
        if (data.currentIndex < 60)
        {
          //text("Fuel Economy: " +  + " Km/L", width/3 + 30, height/3 + 490);
          FuelEconomy.Display(width/30+20,1010, "Fuel Economy: (per L)", nfs(vehicle.fuel.fuelEconomy.get(data.currentIndex-1), 0, 2), "KM" );
        } else 
        {
          //text("Fuel Economy: " + nfs(vehicle.fuel.fuelEconomy.get(59), 0, 2) + " Km/L", width/3 + 30, height/3 + 490);
          FuelEconomy.Display(width/30+20,1010, "Fuel Economy: (per L)", nfs(vehicle.fuel.fuelEconomy.get(59), 0, 2), "KM" );
        }

        

        if (data.currentIndex == 599)
        {
          resetmenu = true; //loads resets program back to loading screen
        }
      }
    }
    if(counter==0){
    delay(1);
    }else if(counter == 1){
    delay(100);
    }else{
    delay(1000);
    }
  }
}

int Center (int a, int b) 
{ 
  //Function to auto center the gauges, first parameter is amount of gauges, and second paramter is position (0 is 1)
  int portions = width/a;
  int xcord = portions/2 + (portions * b);

  return xcord;
}

void createToggleBox() {
  textFont(SmallFont);
  if (counter == 0) {
    
    fill(230, 145, 0);
    rect(18.5*(width/20), 24.5*(height/26), 100, 50);
    fill(255);
    text("Fast", 18.5*(width/20)+17, 24.5*(height/26));
  } else if (counter == 1) {
     fill(122, 228, 255);
    rect(18.5*(width/20), 24.5*(height/26), 100, 50);
    fill(255);
    text("Medium", 18.5*(width/20)+5, 24.5*(height/26));
  } else if (counter == 2) {
    fill(17, 140, 171);
    rect(18.5*(width/20), 24.5*(height/26), 100, 50);
    fill(255);
    text("Real", 18.5*(width/20)+17, 24.5*(height/26));
  }
}

void drawGraph(FloatList data, float x, float y, String name)
{
   textFont(SmallFont);
   fill(80);
   rect(x,y,400,25);
   fill(0, 202, 270);
   rect(x+380, y, 10, 25);
   fill(255);
   text(name,x+10,y+19);
   fill(160);
   rect(x,y+30,400,200);
  fill(0);
  textFont(SuperSmallFont);
  BarChart barChart = new BarChart(this);
  barChart.setData(data.array());

  barChart.setMinValue(0);
  barChart.setMaxValue(25);

  barChart.showValueAxis(true);
  barChart.setValueFormat("#");
  barChart.showCategoryAxis(true);

  barChart.setBarColour(color(0, 202, 270,200));
  barChart.setBarGap(2);
  barChart.draw(x, y+30, 400, 200);

  barChart.setCategoryAxisLabel(name);
}
