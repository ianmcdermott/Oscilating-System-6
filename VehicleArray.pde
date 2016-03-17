class VehicleArray {
  ArrayList<Vehicle> vehicles;
  int arrayNum = 1;
  float radius;
  int colorInt;
  int vehicleNum = 2;
  float osc ;

  VehicleArray(float ms, float mf, int col, int vn, float rad) {
    vehicles = new ArrayList<Vehicle>();
    for (int i = 0; i < vn; i++) {
      newVehicle(random(width), random(height),  ms, mf, col, rad);
    }
  }

  void run(Path p, float o) {
    for (Vehicle v : vehicles) {
      // Path following and separation are worked on in this function
      v.applyBehaviors(vehicles, p);
      // Call the generic run method (update, borders, display, etc.)
      v.run(o);
    }
  }

  void run(VehicleArray v, float o) {
    for (Vehicle vehic : vehicles) {
      // Path following and separation are worked on in this function
      vehic.applyBehaviors(vehicles, v);
      // Call the generic run method (update, borders, display, etc.)
      vehic.run(o);
    }
  }


  void newVehicle(float x, float y, float ms, float mf,  int col, float rad) {
    float maxspeed = ms;
    float maxforce = mf;
    //radius to force 
    radius = rad;
    colorInt = col;
    vehicles.add(new Vehicle(new PVector(x, y), maxspeed, maxforce, radius, colorInt));
  }

  void mouseVehicle(float x, float y) {
    float maxspeed =  random(2, 4);
    float maxforce = 0.3;
    radius = 12;
    colorInt = 255;
    vehicles.add(new Vehicle(new PVector(x, y), maxspeed, maxforce, radius, colorInt));
  }

  void displayPath() {
    strokeJoin(ROUND);

    // Draw thick line for radius

    stroke(colorInt, 0, 0, 50);
    strokeWeight(radius*2);
    noFill();
    beginShape();
    for (Vehicle v : vehicles) {
      vertex(v.location.x, v.location.y);
    }
    endShape(CLOSE);
    // Draw thin line for center of path
    stroke(colorInt, 0, 0, 120);
    strokeWeight(1);
    noFill();
    beginShape();
    for (Vehicle v : vehicles) {
      vertex(v.location.x, v.location.y);
    }
    endShape(CLOSE);
  }
}