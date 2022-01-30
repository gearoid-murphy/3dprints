width = 10;
rotor_radius = 60;
support_thickness = 8;
clearance = 5;
length = rotor_radius + support_thickness + clearance*2;
bottom_thickness = 2;
top_thickness = 2;
rotor_height = 25;
inner_height= rotor_height + clearance*2;
height = inner_height + bottom_thickness + top_thickness;
hole_radius = 0.9;
fn = 64;

module render()
{
  rotate(a=90, v=[1,0,0])
  difference() {
    union() {
      cube(size = [length * 4/5, width, bottom_thickness]);
      translate([length * 3/5, 0, bottom_thickness])
      cube(size = [length * 2/5, width, bottom_thickness]);
      cube(size = [support_thickness, width, height]);
      translate([0, 0, height-top_thickness])
      cube(size = [length, width, top_thickness]);
    }
    translate([length-clearance,
               width/2, -1])
    cylinder(h = height + 2, r1 = hole_radius,
             r2 = hole_radius, $fn=fn);
  }
}

echo(length=length);
echo(height=inner_height - bottom_thickness);
echo(version=version());

render();
