
class Path {

  // A Path is an arraylist of points (PVector objects)
  ArrayList<PVector> points;
  // A path has a radius, i.e how far is it ok for the boid to wander off
  float radius;

  Path() {
    // Arbitrary radius of 20
    radius = 50;
    points = new ArrayList<PVector>();
  }

  // Add a point to the path
  void addPoint(float x, float y) {
    PVector point = new PVector(x, y);
    points.add(point);
  }

  // Draw the path
  void display() {
    strokeJoin(ROUND);
    
    // Draw thick line for radius
    stroke(175);
    strokeWeight(radius*2);
    noFill();
    beginShape();
    for (PVector v : points) {
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
    // Draw thin line for center of path
    stroke(0);
    strokeWeight(1);
    noFill();
    beginShape();
    for (PVector v : points) {
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
  }
  
  void updatePoints(float bounceX, float bounceY){
     PVector bounce = new PVector(bounceX, bounceY);
     for(int i = 0; i < points.size(); i++){
       points.get(i).add(bounce);
       if(i % 2 == 0) bounce.mult(-1);
          //    if(i % 4 == 0) bounce.mult(1.2);

     }
  }
}