public class VertexVertex{
    
    List<Vector> vertexList;
    PShape shapeVertex = createShape();
    
    public VertexVertex(List<Vector> vertexList) {
        this.vertexList = vertexList;
    }
    
    public void renderMeshInmediate(){
    beginShape(TRIANGLE);
    for(Vector ver : this.vertexList){
      vertex(ver.x(), ver.y(), ver.z());    
    }
    endShape();
    this.vertexList = null;
  }


    public PShape renderMesh(String renderMode){
        if(renderMode == "Immediate"){
           renderMeshInmediate();
        }
        else {
            if (renderMode == "Retained") {
              
                shapeVertex.beginShape(TRIANGLE_STRIP);
                    shapeVertex.vertex(vertexList.get(0).x(), vertexList.get(0).y(), vertexList.get(0).z());
                    shapeVertex.vertex(vertexList.get(1).x(), vertexList.get(1).y(), vertexList.get(1).z());
                    shapeVertex.vertex(vertexList.get(2).x(), vertexList.get(2).y(), vertexList.get(2).z());
                shapeVertex.endShape();
                shapeVertex.beginShape(TRIANGLE_STRIP);
                    shapeVertex.vertex(vertexList.get(0).x(), vertexList.get(0).y(), vertexList.get(0).z());
                    shapeVertex.vertex(vertexList.get(1).x(), vertexList.get(1).y(), vertexList.get(1).z());
                    shapeVertex.vertex(vertexList.get(3).x(), vertexList.get(3).y(), vertexList.get(3).z());
               shapeVertex.endShape(); 
               shapeVertex.beginShape(TRIANGLE_STRIP);
                    shapeVertex.vertex(vertexList.get(0).x(), vertexList.get(0).y(), vertexList.get(0).z());
                    shapeVertex.vertex(vertexList.get(3).x(), vertexList.get(3).y(), vertexList.get(3).z());
                    shapeVertex.vertex(vertexList.get(2).x(), vertexList.get(2).y(), vertexList.get(2).z());
               shapeVertex.endShape();
               shapeVertex.beginShape(TRIANGLE_STRIP);
                    shapeVertex.vertex(vertexList.get(3).x(), vertexList.get(3).y(), vertexList.get(3).z());
                    shapeVertex.vertex(vertexList.get(1).x(), vertexList.get(1).y(), vertexList.get(1).z());
                    shapeVertex.vertex(vertexList.get(2).x(), vertexList.get(2).y(), vertexList.get(2).z());
                    //System.out.println("retained vertex vertex");
                shapeVertex.endShape();
               
               return shapeVertex;
            }
            
        }
        return shapeVertex;

    }


}
