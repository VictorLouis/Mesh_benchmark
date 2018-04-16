public class VertexVertex{
    
    List<Vector> vertexList;
    PShape shapeVertex = createShape();
    
    public VertexVertex(List<Vector> vertexList) {
        this.vertexList = vertexList;
    }
    public void renderFace1(){
      beginShape(TRIANGLE_STRIP);
                vertex(vertexList.get(0).x(), vertexList.get(0).y(), vertexList.get(0).z());
                vertex(vertexList.get(1).x(), vertexList.get(1).y(), vertexList.get(1).z());
                vertex(vertexList.get(2).x(), vertexList.get(2).y(), vertexList.get(2).z());
      endShape();  
    }
    public void renderFace2(){
      beginShape(TRIANGLE_STRIP);
                vertex(vertexList.get(0).x(), vertexList.get(0).y(), vertexList.get(0).z());
                vertex(vertexList.get(1).x(), vertexList.get(1).y(), vertexList.get(1).z());
                vertex(vertexList.get(3).x(), vertexList.get(3).y(), vertexList.get(3).z());
      endShape();  
    }
    public void renderFace3(){
      beginShape(TRIANGLE_STRIP);
                vertex(vertexList.get(0).x(), vertexList.get(0).y(), vertexList.get(0).z());
                vertex(vertexList.get(3).x(), vertexList.get(3).y(), vertexList.get(3).z());
                vertex(vertexList.get(2).x(), vertexList.get(2).y(), vertexList.get(2).z());
      endShape();  
    }
    public void renderFace4(){
      beginShape(TRIANGLE_STRIP);
                vertex(vertexList.get(3).x(), vertexList.get(3).y(), vertexList.get(3).z());
                vertex(vertexList.get(1).x(), vertexList.get(1).y(), vertexList.get(1).z());
                vertex(vertexList.get(2).x(), vertexList.get(2).y(), vertexList.get(2).z());
      endShape();  
    }

    public void renderFacesImmediate(){
      renderFace1();
      renderFace2();
      renderFace3();
      renderFace4();    
    }

    public PShape renderMesh(String renderMode){
        if(renderMode == "Immediate"){
           renderFacesImmediate();
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
