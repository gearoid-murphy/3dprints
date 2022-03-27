fn = 128;

margin = 10;
thickness = 1.2;
shim = 0.1;
lens_radius = 11.0 / 2.0;
lens_height = 10;
rim_width = 1;
outer_radius = lens_radius + thickness;
inner_radius = lens_radius + shim;
arm_x = outer_radius*2;
arm_y = 5;
ext_len = outer_radius*4;
m6_attach_diam = 50;
m6_attach_radius = m6_attach_diam/2;
arm_height = m6_attach_diam + 10;
m6_radius = 6 / 2;

module lens_holder() {
  difference() { // lens with retaining rim
    cylinder(lens_height,
             outer_radius,
             outer_radius, $fn=fn);
    translate([0, 0, thickness])
    cylinder(lens_height,
             inner_radius,
             inner_radius, $fn=fn);
    translate([0, 0, -thickness*3])
    cylinder(lens_height*2,
             inner_radius - rim_width,
             inner_radius - rim_width, $fn=fn);
  }
}

module lens_holder_extension() {
  union() {
    lens_holder();
    difference() {
      translate([-outer_radius, 0, 0])
      cube(size = [outer_radius*2, ext_len, lens_height]);
      cylinder(lens_height,
               outer_radius,
               outer_radius, $fn=fn);
    }
  }
}

module stage_fastener() {
  sub_cyl_len = arm_y*2;
  difference() {
    cube(size = [arm_x, arm_y, arm_height]);
    translate([arm_x/2, sub_cyl_len/2 + arm_y/2, arm_height/2 + m6_attach_diam/2])
    rotate(a = 90, v = [1, 0, 0])
    cylinder(sub_cyl_len,
             m6_radius + shim,
             m6_radius + shim, $fn=fn);
    translate([arm_x/2, sub_cyl_len/2 + arm_y/2, arm_height/2 - m6_attach_diam/2])
    rotate(a = 90, v = [1, 0, 0])
    cylinder(sub_cyl_len,
             m6_radius + shim,
             m6_radius + shim, $fn=fn);
  }
}


module render() {
  echo(arm_height=arm_height);
  union() {
    translate([0, -ext_len, 0]) 
    lens_holder_extension();
    translate([-outer_radius, 0, -arm_height/2 + lens_height/2]) 
    stage_fastener();
  }
}

echo(version=version());

render();
