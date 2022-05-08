fn = 128;
wheel_radius = 102 / 2;
support_width = 30;

mount_inner_edge_to_edge = 44;
mount_outer_edge_to_edge = 57;
mount_width = 6.5;
thickness = 3;
wheel_margin = 4;
mount_total_width = 69;
shield_radius = wheel_radius + wheel_margin;
shield_height = 25;
bridge_length = 30;
bridge_offset = 9 - wheel_margin;
bridge_y_offset = (shield_radius - bridge_length +
                   bridge_offset - thickness);
v_mount_y_offset = shield_radius + bridge_offset - thickness;
v_mount_height = 45;
mount_space_y_offset = (v_mount_y_offset -
                        bridge_length +
                        thickness);
aperture_size = 22.5;
aperture_offset = 38;

rebar_len = 4.5;

module shield() {
  union() {
    difference() {
      cylinder(h = shield_height,
               r1 = shield_radius+thickness,
               r2 = shield_radius+thickness, $fn=fn);
      translate([0, 0, thickness])
      cylinder(h = shield_height,
         r1 = shield_radius,
         r2 = shield_radius, $fn=fn);
    }

    translate([-mount_total_width/2, bridge_y_offset, 0])
    cube(size = [mount_total_width, bridge_length, thickness]);
    translate([-mount_total_width/2, v_mount_y_offset, 0])
    cube(size = [mount_total_width, thickness, v_mount_height]);
    translate([support_width/2, v_mount_y_offset-rebar_len, 0])
    cube(size = [thickness, rebar_len, shield_height]);
    translate([-support_width/2-thickness, v_mount_y_offset-rebar_len, 0])
    cube(size = [thickness, rebar_len, shield_height]);
  }
}

module apertures() {
  translate([-support_width/2,
             mount_space_y_offset,
             thickness])
  cube(size = [support_width, bridge_length, v_mount_height]);
  translate([-aperture_size/2,
             -aperture_size/2 - aperture_offset,
             -v_mount_height/2])
  cube(size = [aperture_size, aperture_size, v_mount_height]);
  translate([-mount_width/2 - mount_inner_edge_to_edge/2 - mount_width/2,
             -mount_width/2 + v_mount_y_offset, thickness + v_mount_height/3])
  cube(size = [mount_width, mount_width, v_mount_height/2]);
  translate([-mount_width/2 + mount_inner_edge_to_edge/2 + mount_width/2,
             -mount_width/2 + v_mount_y_offset, thickness + v_mount_height/3])
  cube(size = [mount_width, mount_width, v_mount_height/2]);  
}

module render() {
  difference() {
    shield();
    apertures();
  }
}

echo(version=version());
render();
