class FuelTank 
{
  float tankCapacity;
  
  float consumedFuel;
  float fuelLevel;
  float previousLevel;

  void setTank(String input)
  {
    if (input.equals("truck"))
      tankCapacity = 80;

    else if (input.equals("bmw"))
      tankCapacity = 60;
  }

  float getConsumedFuel(float current, float previous)
  {
    consumedFuel = previous - current; //within the second
    return consumedFuel;
  }
}
