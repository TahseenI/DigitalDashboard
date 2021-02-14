class FuelComputer 
{
  FloatList fuelEconomy        = new FloatList(60);    //for average fuel economy
  FloatList fuelEconomyHistory = new FloatList(40);   //for the bar graph (average fuel economies)
  FloatList consumptionHistory = new FloatList(40);

  float consumption;
  float econSum;
  float averageEconomy; //keeps track of the current average fuel economy. this variable is used in member functions that are meant to use the average fuel economy
  float range; //once we get average economy, this is easy to calculate

  void calculateEconomy(float distance, float consumed, int index)
  {
    //for(int i = 0, i < 60, i++)
    //if (i<59) -> fuelEconomyHistory[i] = fuelEconomyHistory[i+1];
    //elseif(i == 59) -> fuelEconomyHistory[i] = distance / consumed
    
    if(index > 60)
    {
      //for indexes greater than 60, the list removes the first element (which is the oldest element)
      fuelEconomy.remove(0);
    }
    
    //adds a new element onto the list
    if(consumed == 0)
    {
      fuelEconomy.append(0);
    }
    else
    {
      fuelEconomy.append(distance/consumed);
    }
  }

  void calculateAverageEconomy()
  {    
    econSum = 0; //reset to 0 each time the function is called
    
    for(int i = 0; i < fuelEconomy.size(); i++)
    {
      econSum += fuelEconomy.get(i);
    }
    
    if(fuelEconomyHistory.size() > 39)
    {
      fuelEconomyHistory.remove(0); //removes the first element in the history list if there are more than 40 elements
    }
    
    averageEconomy = econSum / fuelEconomy.size();
    fuelEconomyHistory.append(averageEconomy); //adds the current average fuel economy to the history list
  }

  float calculateConsumption()
  {
    if(consumptionHistory.size() > 39)
    {
      consumptionHistory.remove(0);
    }
    
    consumption = (100/averageEconomy);
    consumptionHistory.append(consumption);
    
    return consumption;
  }

  float getRange(float remainingFuel)
  {
    range = averageEconomy * remainingFuel;
    return range;
  }
}
