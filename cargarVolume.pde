//aqui podria hacer una funcion que recibiera de entrada un string y devolviera un PShape
//pero siento que cargar todos dentro de un ciclo anidado es mejor que hacerlo en varios ciclos anidados
//distintos.

void cargarVolume() {

  gfx=new ToxiclibsSupport(this);
  strokeWeight(0.5);

  //byte[] mriDataGli=loadBytes("phantom_1.0mm_normal_crisp.rawb");
  byte[] mriDataGli=loadBytes("phantom_1.0mm_normal_gli.rawb");
  byte[] mriDataGry=loadBytes("phantom_1.0mm_normal_wht.rawb");
  byte[] mriDataSkl=loadBytes("phantom_1.0mm_normal_skl.rawb");

  VolumetricSpaceArray volumeGli = new VolumetricSpaceArray(size, sizeX, sizeY, sizeZ);
  VolumetricSpaceArray volumeGry = new VolumetricSpaceArray(size, sizeX, sizeY, sizeZ);
  VolumetricSpaceArray volumeSkl = new VolumetricSpaceArray(size, sizeX, sizeY, sizeZ);

  float[] gli = volumeGli.getData();
  float[] gry = volumeGry.getData();
  float[] skl = volumeSkl.getData();


  int idx = 0;
  for (int x = 0; x < sizeX; x++) {
    for (int y = 0; y < sizeY; y++) {
      for (int z = 0; z < sizeZ; z++) {
        gli[idx] = mriDataGli[x + y*sizeX + z*sizeX*sizeY] & 0xff;
        gry[idx] = mriDataGry[x + y*sizeX + z*sizeX*sizeY] & 0xff;
        skl[idx] = mriDataSkl[x + y*sizeX + z*sizeX*sizeY] & 0xff;
        idx++;
      }
    }
  }


  long t0=System.nanoTime();
  // create IsoSurface and compute surface mesh for the given iso threshold value
  surfaceGli=new HashIsoSurface(volumeGli, 0.15);
  surfaceGry=new HashIsoSurface(volumeGry, 0.15);
  surfaceSkl=new HashIsoSurface(volumeSkl, 0.15);

  meshGli=surfaceGli.computeSurfaceMesh(null, ISO_THRESHOLD);
  meshGry=surfaceGry.computeSurfaceMesh(null, ISO_THRESHOLD);
  meshSkl=surfaceSkl.computeSurfaceMesh(null, ISO_THRESHOLD);


  TMGli = (TriangleMesh) meshGli;
  TMGry = (TriangleMesh) meshGry;
  TMSkl = (TriangleMesh) meshSkl;

  PSGli = toxicToPShape(TMGli);
  PSGry = toxicToPShape(TMGry);
  PSSkl = toxicToPShape(TMSkl);

  float timeTaken=(System.nanoTime()-t0)*1e-6;
  println(timeTaken+"ms to compute ");
  println("gli: " + meshGli.getNumFaces()+" faces");
  println("gry: " + meshGry.getNumFaces()+" faces");
  println("skl: " + meshSkl.getNumFaces()+" faces");
  println("numero de vertices: " + (meshGli.getNumVertices()+ meshGry.getNumVertices() +meshSkl.getNumVertices()));
  println("total de faces: "  + (meshGli.getNumFaces() + meshGry.getNumFaces() + meshSkl.getNumFaces()));
}  
