//this file includes all functions that deal with displaying the menu or text on the main dashboard
//including, the startup menu, bootup animation

void printBoot()
{

  background(200);
  textFont(MedFont);
  fill(24, 102, 173);
  text(displayMessage, width/2 - textWidth(displayMessage)/2, 3.3*height/5);
  fill(80);
  rect(0, 2*(height/3), width, 2*(height/3));
  fill(150);
  rect( width/2 - (2*width/3)/2, 3*height/5, 2*width/3, height/40);

  noFill();
  strokeWeight(30);
  stroke(140);
  arc(width/2, 2*height/5, 300, 300, 0, TWO_PI);

  stroke(colorz, colorz2, colorz3);
  if (colorz > 190) {
    
    
    if(colorz2 < 240){
      
      
    colorz2 ++;
    }else{
    colorz3 ++;
    }
  } else {
    colorz++;
  }
  strokeWeight(20);
  arc(width/2, 2*height/5, 300, 300, QUARTER_PI + xcounterarc, TWO_PI + xcounterarc);

  strokeWeight(0);
  if (xcounter < 2*width/3) 
  {
    xcounter += 2;
  } else 
  {
    bootup = true;
  }

  if (xcounter%100 == 0) 
  {
    switchMessage();
  }

  if (xcounter%10 == 0) 
  {
    xcounterarc += 1;
  }

  fill(0, 202, 270);
  rect( width/2 - (2*width/3)/2, 3*height/5, xcounter, height/40);
}

void switchMessage() {
  int randomized = int(random(1, 10));
  println(randomized);

  if (randomized == 1) {
    displayMessage = "This actually serves no purpose!";
  } else if (randomized == 2) {
    displayMessage = "Loading Assets..";
  } else if (randomized == 3) {
    displayMessage = "Developed by Tahseen & Samson";
  } else if (randomized == 4) {
    displayMessage = "We love our TA Fernando! <3";
  } else if (randomized == 5) {
    displayMessage = "Powering over 2 users in the world!";
  } else if (randomized == 6) {
    displayMessage = "Powered by Intel (Just Kidding)";
  } else if (randomized == 7) {
    displayMessage = "Does anyone actually pay attention to these?";
  } else if (randomized == 8) {
    displayMessage = "Loading .csv files..";
  } else if (randomized == 9) {
    displayMessage = "Developed for ENGG233..";
  } else if (randomized == 10) {
    displayMessage = "You are running Build Version: " + buildversion;
  } else {
    displayMessage = "This message should really not be showing up...?";
  }
}

void printMenu()
{

  if (animationx > (5.5*height/10)) 
  {
    animationx -= 1;
  }

  background(200);
  image(img, 0, animationx);
  noStroke();
  fill(80);
  rect(0, 2*(height/3), width, 2*(height/3));

  fill(24, 102, 173);
  if (animationx2 >= 2*(height/3)+30) 
  {
    animationx2 -= 7;
  }
  rect(0, animationx2, width, 2*(height/3));

  if (animationx2 <= 2*(height/3)+30) 
  {
    fill(255);
    textFont(SmallFont);

    text("Time: " + time, 0.5*(width/20), 24*(height/26));
    text("Build Version: " + buildversion, 0.5*(width/20), 24.5*(height/26));

    if (platform == MACOSX) 
    {
      text("Operating System: " + System.getProperty("os.name") + "/" + System.getProperty("os.arch") + "/" + System.getProperty("os.version"), 0.5*(width/20), 25.5*(height/26));
      text("[MACOSX Detected! Application does not register keypresses in fullscreen]", width/2 - textWidth("[MACOSX Detected! Application does not register keypresses in fullscreen]")/2, 3.5*height/5);
    } else 
    {
      text("Operating System: " + System.getProperty("os.name") + "/" + System.getProperty("os.arch") + "/" + System.getProperty("os.version"), 0.5*(width/20), 25.5*(height/26));
    }

    if (width > 2000) 
    {
      fill(240, 0, 0);
      text("Display Size: " + width + "x" + height, 0.5*(width/20), 25*(height/26));
      textFont(MedFont);
      text("[Screen Size Not Optimized, Please consider using different screen size!]", width/2 - textWidth("[Screen Size Not Optimized, Please consider using different screen size!]")/2, 3*height/5);
    } else 
    {
      text("Display Size: " + width + "x" + height, 0.5*(width/20), 25*(height/26));
    }

    fill(0);
    stroke(0);

    textFont(MedFont);
    fill(255);

    text("Toggle Speed [T]", 14*(width/20), 25.5*(height/26));
    createToggleBox();
    textFont(trench);
    fill(0);
    text("Please pick an option", width/20, height/10);
    text("BMW", width/8, 2*height/10);
    text("Truck", width/8, 3*height/10);
    text("Exit Program", width/8, 4*height/10);
    fill(230);
    strokeWeight(5);
    rect(width/12, 2*height/10 - 50, 50, 50);
    rect(width/12, 3*height/10 - 50, 50, 50);
    rect(width/12, 4*height/10 - 50, 50, 50);
    fill(0);
    textFont(Adonix);
    text("1", width/12, 2*height/10);
    text("2", width/12, 3*height/10);
    text("3", width/12, 4*height/10);

    if (keyPressed) 
    {
      if (key == '1') 
      {
        data.loadSensorDataProvider("car_status_BMW_323i");
        data.Initialize();
        println();
        vehicle.trip.setVehicle("bmw");
        vehicle.tank.setTank("bmw");
        vehicletype = "BMW";
        startup = false;

        if (FernandoMode) {
          Speed.setMax(data.returnMaximumSpeed(0.23));
          RPM.setMax(data.returnMaximum("RPM"));
          fuel.setMax(data.returnMaximum("Fuel Level (liter)"));
        } else {
          Speed.setMax(200);
          RPM.setMax(3000);
          fuel.setMax(60);
        }
      } else if (key == '2') 
      {
        data.loadSensorDataProvider("car_status_Truck_F150");
        data.Initialize();
        vehicle.trip.setVehicle("truck");
        vehicle.tank.setTank("truck");
        vehicletype = "Truck";
        startup = false;

        if (FernandoMode) {
          Speed.setMax(data.returnMaximumSpeed(0.254));
          RPM.setMax(data.returnMaximum("RPM"));
          fuel.setMax(data.returnMaximum("Fuel Level (liter)"));
        } else {

          Speed.setMax(170);
          RPM.setMax(3000);
          fuel.setMax(80);
        }
      } else if (key == '3') 
      {
        exit();
      } else if (key == 'T' || key == 't') 
      {
        if (counter == 2) 
        {
          counter = 0;
        } else {
          counter++;
        }
        keyPressed = false;
      }
      delay(1);
    }
  }
}
