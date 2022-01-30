module render()
{
  fn = 128;
  thickness = 0.5;
  expansion_fudge = 0.5;
  outer_radius = (250.0 +
                  thickness*2.0 +
                  expansion_fudge) / 2.0;
  outer_height = 5;
  inner_radius = 100.5 / 2.0;
  inner_height = 2;
  
  difference() {
    union() {
      cylinder(h = thickness,
               r1 = outer_radius,
               r2 = outer_radius, $fn=fn);
      translate([0, 0, thickness])
      difference() {
        cylinder(h = outer_height,
                 r1 = outer_radius,
                 r2 = outer_radius, $fn=fn);
        cylinder(h = outer_height,
                 r1 = outer_radius-thickness,
                 r2 = outer_radius-thickness, $fn=fn);
      }
      difference() {
        cylinder(h = inner_height,
                 r1 = inner_radius,
                 r2 = inner_radius, $fn=fn);
        cylinder(h = inner_height,
                 r1 = inner_radius-thickness,
                 r2 = inner_radius-thickness, $fn=fn);
      }
    }
    cylinder(h = inner_height,
             r1 = inner_radius-thickness,
             r2 = inner_radius-thickness, $fn=fn);
  }
}

echo(version=version());

render();
