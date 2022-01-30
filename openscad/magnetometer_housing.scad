board_length = 83.0;
board_width = 54.4;
board_depth = 10.0;

lcd_length = 98.0;
lcd_width = 60.0;
lcd_support_height = 40;
lcd_support_radius = 4.0 / 2.0;
lcd_support_stub_radius = 2.5 / 2.0;
lcd_support_stub_height = 2.0;
lcd_support_screw_radius = 3.0 / 2.0;

sensor_support_length = 140;
sensor_support_width = 10;
sensor_support_thickness = 2.5;

fn = 16;
margin = 1.5;

support_length_offset = (lcd_length / 2.0) -
                         lcd_support_radius;
support_width_offset = (lcd_width / 2.0) -
                         lcd_support_radius;
base_depth = (board_depth + margin) / 2.0;

module support_column(l_modifier, w_modifier) {
  translate([l_modifier*support_length_offset, 
             w_modifier*support_width_offset,
            -base_depth])
  cylinder(h = lcd_support_height,
           r1 = lcd_support_radius,
           r2 = lcd_support_radius, $fn=fn);
  translate([l_modifier*support_length_offset, 
             w_modifier*support_width_offset,
            lcd_support_height - base_depth])
  cylinder(h = lcd_support_stub_height,
           r1 = lcd_support_stub_radius,
           r2 = lcd_support_stub_radius, $fn=fn);
}

module screw_hole(l_modifier, w_modifier) {
  translate([l_modifier*support_length_offset, 
             w_modifier*support_width_offset,
            -(base_depth + margin)])
  cylinder(h = margin*2,
           r1 = lcd_support_screw_radius,
           r2 = lcd_support_screw_radius, $fn=fn);
}

module sensor_support() {
  sensor_length_offset = (sensor_support_length / 2.0) +
                         (board_length / 2.0);
  sensor_depth_offset = (base_depth -
                         sensor_support_thickness/2.0
                         + margin/2.0);
  translate([sensor_length_offset, 0, -sensor_depth_offset])
  cube(size = [sensor_support_length,
               sensor_support_width,
               sensor_support_thickness], center=true);
}

module render() {
  union() {
    difference() {
      cube(size = [board_length + margin*2,
                   board_width + margin*2,
                   board_depth + margin*2], center=true);
      translate([0, 0, margin])
      cube(size = [board_length,
                   board_width,
                   board_depth], center=true);
    }
    difference() {
    translate([0, 0, -base_depth ])
    cube(size = [lcd_length,
                 lcd_width,
                 margin], center=true);
      screw_hole(+1.0, +1.0);
      screw_hole(-1.0, +1.0);
      screw_hole(+1.0, -1.0);
      screw_hole(-1.0, -1.0);
    }

    sensor_support();
  }
}

echo(version=version());

render();
