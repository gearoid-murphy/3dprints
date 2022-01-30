module render()
{
  outer_radius = 150.0 / 2.0;
  outer_height = 2.5;
  dimple_radius = 1.4;
  dimple_offset = 8;
  dimple_height = 3;
  fn = 64;

  union() {
    cylinder(h = 1,
             r1 = outer_radius,
             r2 = outer_radius, $fn=fn);
    translate([0, 0, 1])
    difference() {
      cylinder(h = outer_height,
               r1 = outer_radius,
               r2 = outer_radius, $fn=fn);
      cylinder(h = outer_height,
               r1 = outer_radius-1,
               r2 = outer_radius-1, $fn=fn);
    }
    for (p = [[dimple_offset , 0],
              [-dimple_offset , 0],
              [0, dimple_offset],
              [0, -dimple_offset]]) {
      translate([p[0], p[1],
                1])
      cylinder(h = dimple_height,
               r1 = dimple_radius,
               r2 = dimple_radius, $fn=fn);
    }
  }
}

echo(version=version());

render();
