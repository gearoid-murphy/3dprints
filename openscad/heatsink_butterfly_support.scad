// 29.24 from hole to hole
thickness = 2.0;
height = thickness;
correction_shim = 0.2;
width = 40 + correction_shim;
length = 20;
flange_depth = 10;
fn = 128;

module render()
{
  union() {
    cube(size = [length, width, height], center=true);
    translate([0, width/2 + thickness/2, flange_depth/2 - thickness/2]) {
      cube(size = [length, thickness, flange_depth], center=true);
    }
    translate([0, -width/2 - thickness/2, flange_depth/2 - thickness/2]) {
      cube(size = [length, thickness, flange_depth], center=true);
    }
  }
}

echo(version=version());

render();
