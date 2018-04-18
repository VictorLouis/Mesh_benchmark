class Mesh {
  // radius refers to the mesh 'bounding sphere' redius.
  // see: https://en.wikipedia.org/wiki/Bounding_sphere
  float radius = 400;
  PShape shape;
  // mesh representation
  ArrayList<PVector> vertices;

  // rendering mode
  boolean retained;

  // visual modes
  // 0. Faces and edges
  // 1. Wireframe (only edges)
  // 2. Only faces
  // 3. Only points
  int mode;

  // visual hints
  boolean boundingSphere;
  int startVertexIndex = 0;

  Mesh() {
    build();
    //use processing style instead of pshape's, see https://processing.org/reference/PShape.html
    shape.disableStyle();
  }

  // compute both mesh vertices and pshape
  // TODO: implement me
  void build() {
    vertices = new ArrayList<PVector>();
    

    // for example if we were to render a quad:
   
    //...

    shape = loadShape("Golden_Fish_OBJ.obj");
    
  getVertices(shape,vertices);
  println(vertices);

    //don't forget to compute radius too
  }

  // transfer geometry every frame
  // TODO: current implementation targets a quad.
  // Adapt me, as necessary
  void drawImmediate() {
    
    beginShape(QUADS);scale(1);
    for(PVector v : vertices)
      vertex(v.x, v.y ,v.z);
    endShape();
  }
  void getVertices(PShape shape,ArrayList<PVector> vertices){
  //for each face in current mesh
  for(int i = 0 ; i < shape.getChildCount(); i++){
    //get each child element
    PShape child = shape.getChild(i);
    int numChildren = child.getChildCount();
    //if has nested elements, recurse
    if(numChildren > 0){
      for(int j = 0 ; j < numChildren; j++){
        getVertices(child.getChild(j),vertices);
      } 
    }
    //otherwise append child's vertices
    else{
      //get each vertex and append it
      for(int j = 0 ; j < child.getVertexCount(); j++){
        vertices.add(child.getVertex(j));
      }
    }
  }
}
void drawVerticesSelection(){
  
  beginShape(POINTS);
  for(int i = startVertexIndex; i < vertices.size(); i++){
    PVector v = vertices.get(i);
    vertex(v.x,v.y,v.z);
  }
  endShape();
}

  void draw() {
    pushStyle();

    // mesh visual attributes
    // manipuate me as you wish
    int strokeWeight = 1;
    color lineColor = color(255, retained ? 0 : 255, 0);
    color faceColor = color(0, retained ? 0 : 255, 255, 100);
    
    strokeWeight(strokeWeight);
    stroke(lineColor);
    fill(faceColor);
    // visual modes
    switch(mode) {
    case 1:
      noFill();
      break;
    case 2:
      noStroke();
      break;
    case 3:
    drawVerticesSelection(); 
      // TODO: implement me
      break;
    }

    // rendering modes
    if (retained){
      shape(shape);
    }
    else{
      drawImmediate();
    }
    popStyle();

    // visual hint
    if (boundingSphere) {
      pushStyle();
      noStroke();
      fill(0, 255, 255, 125);
      sphere(radius);
      popStyle();
    }
  }
}
