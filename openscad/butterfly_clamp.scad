// 29.24 from hole to hole
height = 1;
width = 5;
inter_hole_dist = 23;
margin = 4;
length = inter_hole_dist + margin * 2;

hole_radius = 3.0/2;
fn = 128;

module render()
{
  rotate(a=90, v=[1,0,0])
  difference() {
    cube(size = [width+2, height, length], center = true);

    translate([0, 0, -length/2 + margin])
    rotate(a=90, v=[1,0,0])
    cylinder(h=width+2,
             r1=hole_radius,
             r2=hole_radius, $fn=fn, center = true);

    translate([0, 0, length/2 - margin])
    rotate(a=90, v=[1,0,0])
    cylinder(h=width+2,
             r1=hole_radius,
             r2=hole_radius, $fn=fn, center = true);
  }
}

echo(version=version());

render();
