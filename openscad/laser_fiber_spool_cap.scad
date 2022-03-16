fn = 128;
// fn = 16;

margin = 10;
thickness = 1.0;
shim = 0.2;
spool_radius = 80.0 / 2.0;
spool_height = 10;

module render() {
  union() {
  cylinder(thickness,
           spool_radius+margin,
           spool_radius+margin, $fn=fn);
    difference() {
      cylinder(spool_height,
               spool_radius - shim,
               spool_radius - shim, $fn=fn);
      translate([0, 0, thickness])
      cylinder(spool_height,
               spool_radius-thickness,
               spool_radius-thickness, $fn=fn);
    }
  }
}

echo(version=version());


render();
