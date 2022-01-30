module render()
{
  spindle_height = 80;
  spindle_bottom_radius = 10;
  spindle_top_radius = 2;
  base_height = 2.5;
  base_radius = 30;
  pinhole_depth = 12;
  pinhole_radius = 0.65;
  nailhole_length = 10;
  nailhole_radius= 1.5;

  difference() {
    union() {
      cylinder(h = spindle_height,
               r1 = spindle_bottom_radius,
               r2 = spindle_top_radius, $fn=64);
      cylinder(h = base_height,
               r1 = base_radius,
               r2 = base_radius, $fn=64);
    }
    translate([0, 0, spindle_height-pinhole_depth])
    cylinder(h = pinhole_depth,
             r1 = pinhole_radius,
             r2 = pinhole_radius, $fn=64);
    translate([0, 0, spindle_height-pinhole_depth])
    rotate([90, 0, 0])
    cylinder(h = nailhole_length,
            r1 = nailhole_radius,
            r2 = nailhole_radius, $fn=64, center=true);
  }

}

echo(version=version());

render();
