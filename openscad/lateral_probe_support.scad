fn = 8;
inner_width = 160;
rail_edge_width = 9;
rail_thickness = 25;
width = 8;
base_length = inner_width + rail_thickness*2;
m6_radius = 6.3 / 2;
m5_radius = 7 / 2;
m3_radius = 3.3 / 2;
pogo_pin_radius = 5 / 2;
probe_length = 63;
m3_aperture_offset = 25;
m1_v_offset = 4;
m1_i_offset = 9;
pcb_depth = 1.56;
pogo_pin_length = 19 - 4;
flange_thickness = 5;
total_probe_height = flange_thickness;

// pogo pin residual height = ~6mm
// 1mm clearance
// 5mm
// pcb height = 1.3
echo(total_probe_height=total_probe_height);

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

module probe_cylinders(x_offset, y_offset, z_offset,
                       cylinder_height, render_cylinder=1) {
  union() {
    if (render_cylinder == 1) {
      translate([x_offset, y_offset, z_offset])
      cylinder(h = cylinder_height,
              r1 = m5_radius,
              r2 = m5_radius, $fn=fn);
    }
    translate([x_offset+m1_v_offset, y_offset, z_offset])
    cylinder(h = cylinder_height,
            r1 = pogo_pin_radius,
            r2 = pogo_pin_radius, $fn=fn);
    translate([x_offset-m1_v_offset, y_offset, z_offset])
    cylinder(h = cylinder_height,
            r1 = pogo_pin_radius,
            r2 = pogo_pin_radius, $fn=fn);
    translate([x_offset+m1_i_offset, y_offset, z_offset])
    cylinder(h = cylinder_height,
            r1 = pogo_pin_radius,
            r2 = pogo_pin_radius, $fn=fn);
    translate([x_offset-m1_i_offset, y_offset, z_offset])
    cylinder(h = cylinder_height,
            r1 = pogo_pin_radius,
            r2 = pogo_pin_radius, $fn=fn);
  }
}

module subtracted_cylinders() {
  union() {
    probe_cylinders(base_length/2, width/2, 0,
                    total_probe_height);
    translate([base_length/2+m3_aperture_offset, width/2, 0])
    cylinder(h = total_probe_height,
            r1 = m3_radius,
            r2 = m3_radius, $fn=fn);
    translate([base_length/2-m3_aperture_offset, width/2, 0])
    cylinder(h = total_probe_height,
            r1 = m3_radius,
            r2 = m3_radius, $fn=fn);
  }
}

module render() {
  difference() {
    support_base();
    subtracted_cylinders();
  }
}

echo(version=version());
render();
