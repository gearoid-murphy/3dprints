module render()
{
  disk_radius = 200.0 / 2.0;
  cone_base_radius = 15 / 2.0;
  cone_height = 10.0;
  hole_radius = 5.2 / 2.0;
  hole_height = cone_height / 2.0;
  
  thickness = 0.5;
  fn = 256;
    
  difference() {
    union() {
      cylinder(h = thickness,
               r1 = disk_radius,
               r2 = disk_radius, $fn=fn);
      cylinder(h = cone_height,
               r1 = cone_base_radius,
               r2 = 0, $fn=fn);
    }
    cylinder(h = hole_height,
             r1 = hole_radius,
             r2 = hole_radius, $fn=fn);
  }
}

echo(version=version());

render();
