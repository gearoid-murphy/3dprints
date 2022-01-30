fn = 32;
thickness = 2;
expansion_fudge = 0.5;
// looseness will allow the shaft to rotate freely
looseness = 0.5;

collar_height = 8;
collar_radius = 22.5 / 2.0;
rod_radius = (6 + expansion_fudge) / 2.0;
horz_length = 30;
horz_rod_depth = 15;
horz_width = 15;

module render()
{
  difference() {
    union() {
      cylinder(h = collar_height,
               r1 = collar_radius + thickness,
               r2 = collar_radius + thickness, $fn=fn);
      translate([0, -horz_width/2, 0])
      cube(size = [horz_length, horz_width, collar_height]);
    }
    cylinder(h = collar_height,
             r1 = collar_radius + looseness,
             r2 = collar_radius + looseness, $fn=fn);
    rotate(a=90, v=[0,1,0])
    translate([-collar_height/2.0, 0,
               horz_length-horz_rod_depth])
    cylinder(h = horz_rod_depth,
             r1 = rod_radius,
             r2 = rod_radius, $fn=fn);    
  }
}

echo(version=version());

render();
