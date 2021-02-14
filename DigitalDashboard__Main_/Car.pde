class Car
{
  TripComputer trip = new TripComputer();
  FuelComputer fuel = new FuelComputer();
  FuelTank tank = new FuelTank();
  
  void processInput()
  {
    //reading from the .csv file for the fuel level as well as the previous fuel level
    vehicle.tank.previousLevel = data.readFuelLevel(); 
    data.readNext();
    vehicle.tank.fuelLevel = data.readFuelLevel(); //equivalent to remaining fuel
        
    //based on the values for x and y from the .csv file, this method finds the current direction that the vehicle travels in
    vehicle.trip.getDirection(data.readPastX(), data.readPastY(), data.readX(), data.readY());
    
    //this is how the total distance updates itself (distance in a single second is the same as the speed in that second)
    trip.getCurrentSpeed();
    trip.totalDistance += vehicle.trip.currentSpeed;
    
    //fuel updates
    fuel.calculateEconomy(vehicle.trip.currentSpeed / 1000, vehicle.tank.getConsumedFuel(vehicle.tank.fuelLevel, vehicle.tank.previousLevel), data.currentIndex);
    fuel.calculateAverageEconomy();
    fuel.calculateConsumption();
    fuel.getRange(vehicle.tank.fuelLevel);
    
    
    tank.getConsumedFuel(vehicle.tank.fuelLevel, vehicle.tank.previousLevel);
        
  }
  
}
