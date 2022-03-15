fn = 128;
// fn = 16;

margin = 10;

heat_sink_base_x = 75;
heat_sink_base_y = 75;
thickness = 1.0;
base_rim_height= 3.0;

spool_radius = 80.0 / 2.0;
spool_height = 20;
spool_x_offset = heat_sink_base_x + spool_radius + 2*margin;
spool_y_offset = (heat_sink_base_y / 2) + margin ;

base_x_size = heat_sink_base_x + spool_radius*2 + margin*3;
base_y_size = 2*margin + spool_radius*2;

m4_radius = 4 / 2;

corner_size = spool_radius*2;

module render() {
  difference() {
    union() {
      translate([margin, margin, 0])
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
    translate([margin/2, base_y_size/2, 0])
    cylinder(spool_height,
             m4_radius,
             m4_radius, $fn=fn);
    translate([base_x_size/2, margin/2, 0])
    cylinder(spool_height,
             m4_radius,
             m4_radius, $fn=fn);
    translate([base_x_size/2, base_y_size - margin/2, 0])
    cylinder(spool_height,
             m4_radius,
             m4_radius, $fn=fn);
    translate([margin*1.5 + thickness, margin*1.5 + thickness, 0])
    cube(size = [heat_sink_base_x - margin,
                 heat_sink_base_y - margin,
                 thickness]);
    translate([spool_x_offset,
               spool_y_offset, 0])
    cylinder(spool_height,
             spool_radius-margin,
             spool_radius-margin, $fn=fn);
  }

}

echo(version=version());


render();
