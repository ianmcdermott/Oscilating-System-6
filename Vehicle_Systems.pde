class VehicleSystem {
  int numGen = 30;
  VehicleArray[]va = new VehicleArray[numGen];
  float maxForce = 5;
  float maxSpeed;
  int c = 255;
  int vehicleNum = 10 ;
  float radius = 100;

  VehicleSystem() {
    maxSpeed = .2;
    for (int i = 0; i < va.length; i++) {

      va[i] = new VehicleArray(maxSpeed, maxForce, c, vehicleNum, radius);
      maxSpeed*=1.1;
      maxForce/=.1;
      c-=255/numGen;
      vehicleNum*=1.125;
      radius/=1.1;
    }
  }

  //create a new gen
  void addGeneration() {
    //  va.add();
  }

  void run(float o) {
    for (int i = 0; i < va.length; i++) {
      if (i == 0) va[i].run(path, o);
      else va[i].run(va[i-1], o);
    }
    if (dPath) {
      // Draw predicted future location
      for (int i = 0; i < numGen-1; i++) {
        //   va[i].displayPath();
      }
    }
  }
}