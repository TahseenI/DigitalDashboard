class TripComputer 
{
  float rpm = 0;
  float radius = 0;

  float gearRatio = 0;
  float fuelLevel = 0;

  float currentSpeed = 0;
  float totalDistance = 0;

  float x_position = 0;
  float y_position = 0;
  String direction = "N/A";

  void setVehicle(String input) //constructor
  {
    if (input.equals("truck"))
      radius = 0.254;

    else if (input.equals("bmw"))
      radius = 0.23;
  }

  float getCurrentSpeed()
  {
    gearRatio = data.readRatio();
    fuelLevel = data.readFuelLevel();
    rpm = data.getRPM();

    currentSpeed = ((rpm/60) * (1/gearRatio) * 2 * 3.1415926 * radius); //this is in m/s
    return currentSpeed;
  }
  
  
  
  
  
  

  String getDirection(float x1, float y1, float x2, float y2) 
  {
    float x = x2 - x1;
    float y = y2 - y1;

    if (x > 0 && y > 0) 
    { direction = "NE";
    } else if (x > 0 && y < 0){
      direction = "SE";
    } else if (x < 0 && y < 0) {
      direction = "SW";
    } else if (x < 0 && y > 0) {
      direction = "NW";
    } else if (x == 0 && y > 0){
      direction = "N";
    } else if (x == 0 && y < 0) {
      direction = "S";
    } else if (x < 0 && y == 0) {
      direction = "W";
    }else if(x>0 && y==0){
      direction = "E";
      
    }else{
      direction = "NA";
    }
    return direction;
  }
  
}
