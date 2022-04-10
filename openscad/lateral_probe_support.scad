use <common/prism.scad>

fn = 128;
inner_width = 100;
rail_edge_width = 9;
rail_thickness = 25;
flange_thickness = 2.5;
width = 8;
base_length = inner_width + rail_thickness*2;
m6_radius = 6.3 / 2;
m5_radius = 5.3 / 2;
m3_radius = 3.3 / 2;
m1_radius = 2 / 2;
probe_length = 63;
m3_aperture_offset = 27;
m1_v_offset = 5;
m1_i_offset = 10;
pcb_depth = 1.56;
pogo_pin_length = 19 - 4;
probe_mount_height = (pogo_pin_length - pcb_depth - flange_thickness) ;
total_height = probe_mount_height + flange_thickness;

module probe_mount() {
  translate([base_length/2 - probe_length/2, 0, flange_thickness])
  cube(size = [probe_length, width, probe_mount_height]);
}

module support_base() {
  difference() {
    cube(size = [base_length, width, flange_thickness]);
    translate([rail_thickness/2, width/2, 0])
    cylinder(h = flange_thickness,
            r1 = m6_radius,
            r2 = m6_radius, $fn=fn);
    translate([inner_width + rail_thickness*1.5, width/2, 0])
    cylinder(h = flange_thickness,
            r1 = m6_radius,
            r2 = m6_radius, $fn=fn);
  }
}

module subtracted_cylinders() {
  union() {
    translate([base_length/2, width/2, 0])
    cylinder(h = total_height,
            r1 = m5_radius,
            r2 = m5_radius, $fn=fn);
    translate([base_length/2+m3_aperture_offset, width/2, 0])
    cylinder(h = total_height,
            r1 = m3_radius,
            r2 = m3_radius, $fn=fn);
    translate([base_length/2-m3_aperture_offset, width/2, 0])
    cylinder(h = total_height,
            r1 = m3_radius,
            r2 = m3_radius, $fn=fn);
    translate([base_length/2+m1_v_offset, width/2, 0])
    cylinder(h = total_height,
            r1 = m1_radius,
            r2 = m1_radius, $fn=fn);
    translate([base_length/2-m1_v_offset, width/2, 0])
    cylinder(h = total_height,
            r1 = m1_radius,
            r2 = m1_radius, $fn=fn);
    translate([base_length/2+m1_i_offset, width/2, 0])
    cylinder(h = total_height,
            r1 = m1_radius,
            r2 = m1_radius, $fn=fn);
    translate([base_length/2-m1_i_offset, width/2, 0])
    cylinder(h = total_height,
            r1 = m1_radius,
            r2 = m1_radius, $fn=fn);
  }
}

module render() {
  difference() {
    union() {
      support_base();
      probe_mount();
    }
  subtracted_cylinders();
  }
}

echo(version=version());

render();
