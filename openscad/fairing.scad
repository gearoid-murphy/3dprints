inner_radius= 28.0 / 2;
outer_radius = 42.2 / 2;
inner_height = 20;
outer_height = 45;
fn = 256;

module render() { 
  union() {
    difference() {
      cylinder(h = inner_height,
               r1 = inner_radius+1,
               r2 = inner_radius+1, $fn=fn);
      cylinder(h = inner_height,
               r1 = inner_radius,
               r2 = inner_radius, $fn=fn);
    }
    translate([0, 0, inner_height])
    difference() {
      cylinder(h = outer_height,
               r1 = outer_radius+1,
               r2 = outer_radius+1, $fn=fn);
      cylinder(h = 1,
               r1 = inner_radius,
               r2 = inner_radius, $fn=fn);
      translate([0, 0, 1])
      cylinder(h = outer_height,
               r1 = outer_radius,
               r2 = outer_radius, $fn=fn);
    }
  }
}

echo(version=version());

render();
