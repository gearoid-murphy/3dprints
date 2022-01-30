r1= 100 / 2.0; // base radius
r2= 75 / 2.0;  // top radius
h = 60;   // height
m = 1.8;  // margin
d = 100; // difference dim

fn = 128;


module render() {
  difference() {
    cylinder(h=h, r1=r1, r2=r2, center=false);
    translate([m, m, 0])
    cube([d, d, d],false);
    translate([-d-m, -d-m, 0])
    cube([d, d, d],false);
    translate([-d-m, m, 0])
    cube([d, d, d],false);
    translate([m, -d-m, 0])
    cube([d, d, d],false);
  }
}

echo(version=version());

render();
