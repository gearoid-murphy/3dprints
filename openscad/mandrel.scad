module render()
{
  inner_radius = 2.5 / 2.0;
  outer_radius = 40.0 / 2.0;
  inner_height = 2;
  outer_height = 2;
  dimple_radius = 1.4;
  dimple_offset = 8;
  dimple_height = 6;
  cover_radius = 24/2;
  cover_height = 15.0;
  thickness = 2.0;
  fn = 256;

  union() {
    cylinder(h = inner_height,
             r1 = inner_radius,
             r2 = inner_radius, $fn=fn);

    translate([0, 0, inner_height])
    cylinder(h = outer_height,
             r1 = outer_radius,
             r2 = outer_radius, $fn=fn);

    translate([0, 0, inner_height+outer_height])
    difference() {
      cylinder(h = cover_height,
               r1 = cover_radius + thickness,
               r2 = cover_radius + thickness, $fn=fn);
      cylinder(h = cover_height + thickness,
               r1 = cover_radius,
               r2 = cover_radius, $fn=fn);
    }

    for (p = [[dimple_offset , 0],
              [-dimple_offset , 0],
              [0, dimple_offset],
              [0, -dimple_offset]]) {
      translate([p[0], p[1],
                inner_height +
                outer_height])
      cylinder(h = dimple_height,
               r1 = dimple_radius,
               r2 = dimple_radius, $fn=fn);
    }
  }
}

echo(version=version());

render();
