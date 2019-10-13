PShape toxicToPShape(final TriangleMesh m) {
  m.computeVertexNormals();

  List<Face> triangles = m.getFaces();
  PShape shp;
  shp = createShape();
  shp.setStroke(false);
  shp.beginShape(PConstants.TRIANGLES);
  shp.textureMode(PConstants.NORMAL);

  for (final Face t : triangles) {
    shp.normal(t.a.normal.x, t.a.normal.y, t.a.normal.z);
    shp.vertex(t.a.x, t.a.y, t.a.z);

    shp.normal(t.b.normal.x, t.b.normal.y, t.b.normal.z);
    shp.vertex(t.b.x, t.b.y, t.b.z);

    shp.normal(t.c.normal.x, t.c.normal.y, t.c.normal.z);
    shp.vertex(t.c.x, t.c.y, t.c.z);
  }
  shp.endShape();
  shp.disableStyle(); 
  return shp;
}
