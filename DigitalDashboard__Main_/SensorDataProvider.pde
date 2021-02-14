class SensorDataProvider 
{
  int currentIndex = 0;
  String filePath = "";
  Table dataTable;

  void loadSensorDataProvider(String input) {
    filePath = input;
  }

  float returnMaximum(String a){
    float max = 0;
    
    for(int i = 0; i<599; i++){
      if(dataTable.getFloat(i, a) > max){
        max = dataTable.getFloat(i,a);
      }
      
    }
    return max;
  }
    
float returnMaximumSpeed(float radius){
   
    float speed = 0;
    float rpm1;
    float gearRatio1;
    float CalculatedSpeed = 0;
    
    for(int i = 0; i<599; i++){
      
       gearRatio1 = dataTable.getFloat(i, "Gear Ratio");
       rpm1 = dataTable.getFloat(i, "RPM");
       CalculatedSpeed = ((rpm1/60) * (1/gearRatio1) * 2 * 3.1415926 * radius) * 3.6; 
      
      if(CalculatedSpeed > speed){
        
       speed = CalculatedSpeed;
        
        
        
       
      }
      
    }
    
    
    
    
    return speed;
  }
  void Initialize () {
    dataTable = loadTable(filePath + ".csv", "header");
  }
  void readNext() {
    if (currentIndex < 599) {
      currentIndex += 1;
    } else if (currentIndex == 599) {
      println("No more data after index " + currentIndex);
    }
  }

  int getRPM() {
    return dataTable.getInt(currentIndex, "RPM");
  }

  float readFuelLevel() {
    return dataTable.getFloat(currentIndex, "Fuel Level (liter)");
  }

  float readRatio() {
    return dataTable.getFloat(currentIndex, "Gear Ratio");
  }

  float readX() {
    return dataTable.getFloat(currentIndex, "X");
  }

  float readY() {
    return dataTable.getFloat(currentIndex, "Y");
  }

  float readPastX() {
    return dataTable.getFloat(currentIndex-1, "X");
  }

  float readPastY() {
    return dataTable.getFloat(currentIndex-1, "Y");
  }
}
