fn = 64;

module leg() {
  width = 15;
  length = 25.4;
  height= 0.5;
  radius = width / 2;
  m4_radius = 4 / 2;
  m6_radius = 6 / 2;
  difference() {
    union() {
      translate([0, -width/2, 0]) {
        cube(size = [length, width, height]);
      }
      cylinder(
        h = height,
        r1 = radius,
        r2 = radius, $fn=fn);
      translate([length, 0, 0]) {
        cylinder(
          h = height,
          r1 = radius,
          r2 = radius, $fn=fn);
      }
    }
    translate([0, 0, -height]) {
      cylinder(
        h = height*3,
        r1 = m4_radius ,
        r2 = m4_radius , $fn=fn);
    }
    translate([length, 0, -height]) {
      cylinder(
        h = height*3,
        r1 = m6_radius,
        r2 = m6_radius, $fn=fn);
    }
  }
}

module render() {
  leg();
  rotate(a=120, v=[0,0,1]) leg();
  rotate(a=240, v=[0,0,1]) leg();
}

echo(version=version());

render();
