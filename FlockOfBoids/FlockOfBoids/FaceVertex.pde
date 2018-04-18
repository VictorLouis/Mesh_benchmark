import java.util.List;

public class FaceVertex{

    List<Face> faceList;
    List<Vector> vertexList;

    public List<Face> getFaceList() {
        return faceList;
    }

    public void setFaceList(List<Face> faceList) {
        this.faceList = faceList;
    }

    public List<Vector> getVertexList() {
        return vertexList;
    }

    public void setVertexList(List<Vector> vertexList) {
        this.vertexList = vertexList;
    }

    public FaceVertex(List<Face> faceList, List<Vector> vertexList) {

        this.faceList = faceList;
        this.vertexList = vertexList;
    }

    void renderMeshImmediate(){        
      for(Face face : faceList) {
        face.renderFaceImmediate();
       }       
        faceList = null;
        vertexList = null;
    }
    
    PShape renderMeshRetained(){
      PShape shapeFace = createShape();
      for(Face face : faceList) {
        shapeFace=face.renderFaceRetained();
      }
      return shapeFace;
    }

}
