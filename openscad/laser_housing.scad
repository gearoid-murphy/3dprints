fn = 128;

margin = 10;
heat_sink_base_x = 75.5;
heat_sink_base_y = 75.5;
thickness = 1.0;
base_rim_height= 2.5;

spool_radius = 80.0 / 2.0;
spool_height = 30;
spool_x_offset = heat_sink_base_x + spool_radius + margin * 2;
spool_y_offset = heat_sink_base_y + margin/2;


base_x_size = heat_sink_base_x + spool_x_offset;
base_y_size = heat_sink_base_y + spool_radius + margin;

corner_size = spool_radius*2;
m4_radius = (4 + 0.5) / 2.0;

module render() {
  difference() {
    union() {
      translate([margin, 0, 0])
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
      cube(size = [corner_size, corner_size, margin]);
      translate([0, corner_size, 0])
      cylinder(margin,
               corner_size,
               corner_size, $fn=fn);
    }
    translate([margin/2, base_y_size/2, 0])
    cylinder(m4_radius,
             m4_radius,
             m4_radius, $fn=fn);
    translate([heat_sink_base_x+ margin*2, margin/2, , 0])
    cylinder(m4_radius,
             m4_radius,
             m4_radius, $fn=fn);
    translate([heat_sink_base_x+ margin*2,
               base_y_size - margin/2, , 0])
    cylinder(m4_radius,
             m4_radius,
             m4_radius, $fn=fn);
    translate([thickness+margin*1.5, thickness+margin*.5, -5])
    cube(size = [heat_sink_base_x-margin,
                 heat_sink_base_y-margin, 10]);
    
    translate([spool_x_offset, spool_y_offset, 0])
    cylinder(spool_height,
             spool_radius-margin,
             spool_radius-margin, $fn=fn);

  }
}

echo(version=version());


render();
