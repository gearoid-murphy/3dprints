width = 8;
length = 80;
margin = width/2;
hole_radius = 1.2;
fn = 128;

module render()
{
  rotate(a=90, v=[1,0,0])
  difference() {
    cube(size = [width ,width , length], center = true);
    union() {
      translate([0, 0, length/2 - margin])
      rotate(a=90, v=[1,0,0])
      cylinder(h=width+2,
               r1=hole_radius,
               r2=hole_radius, $fn=fn, center = true);
    }
  }
}

echo(version=version());

render();
