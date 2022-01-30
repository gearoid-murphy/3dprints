plug_radius = 4.9 / 2.0;
plug_length = 4.0;
cap_radius = 7.5 / 2.0;
cap_height = 1.0;
cable_hole_radius = 1.2;
cable_hole_length = 20;
fn = 128;

module render()
{
  difference() {
    union() {
      cylinder(h=cap_height,
               r1=cap_radius,
               r2=cap_radius, $fn=fn);
      translate([0, 0, cap_height])
      cylinder(h=plug_length,
               r1=plug_radius,
               r2=plug_radius, $fn=fn);
    }
    cylinder(h=cable_hole_length,
             r1=cable_hole_radius,
             r2=cable_hole_radius, $fn=fn, center=true);
  }
}

echo(version=version());

render();
