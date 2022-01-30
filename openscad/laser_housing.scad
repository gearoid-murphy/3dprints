fn = 128;

heat_sink_base_x = 41;
heat_sink_base_y = 121;
thickness = 0.5;
base_rim_height= 5.0;

spool_radius = 80.0 / 2.0;
spool_height = 20;
spool_x_offset = 100;
spool_y_offset = heat_sink_base_y;
margin = 10;

base_x_size = heat_sink_base_x + spool_x_offset + margin;
base_y_size = heat_sink_base_y + spool_radius + margin;

corner_size = spool_radius*2;

module render() {
  difference() {
    union() {
      difference() {
        cube(size = [heat_sink_base_x + thickness*2,
                     heat_sink_base_y + thickness*2,
                     base_rim_height + thickness]);
        translate([thickness, thickness, thickness])
        cube(size = [heat_sink_base_x,
                     heat_sink_base_y,
                     base_rim_height]);
      }
      translate([spool_x_offset, spool_y_offset, 0])
      difference() {
        cylinder(spool_height,
                 spool_radius+thickness,
                 spool_radius+thickness, $fn=fn);
        cylinder(spool_height,
                 spool_radius,
                 spool_radius, $fn=fn);
      }
      cube(size = [base_x_size, base_y_size, thickness]);

      
    }
    translate([base_x_size - corner_size, 0, 0])
    difference() {
      cube(size = [corner_size, corner_size, 50]);
      translate([0, corner_size, 0])
      cylinder(50,
               corner_size,
               corner_size, $fn=fn);
    }
  }

}

echo(version=version());


render();
