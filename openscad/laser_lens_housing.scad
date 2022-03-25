fn = 128;

margin = 10;
thickness = 1.2;
shim = 0.2;
lens_radius = 11.0 / 2.0;
lens_height = 10;
rim_width = 1;
outer_radius = lens_radius + thickness;
inner_radius = lens_radius + shim;
arm_size = outer_radius*2;
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

module stage_fastener() {
  translate([-outer_radius, 0, -arm_height/2 + lens_height/2]) {
    difference() {     
      cube(size = [arm_size, arm_size * .75, arm_height]);
      translate([outer_radius, 0, 0])
      cylinder(arm_height, outer_radius, outer_radius, $fn=fn);
      translate([0, 0, arm_height / 2  + lens_height/2])
      cube(size = [arm_size, arm_size/2, arm_height]);
      translate([0, 0, -(arm_height / 2  + lens_height/2)])
      cube(size = [arm_size, arm_size/2, arm_height]);
    }
  }
}


module render() {
  difference() {
    union() {
      lens_holder();
      stage_fastener();
    }
    translate([0, lens_height*2, m6_attach_radius + lens_height/2])
    rotate(a = 90, v = [1, 0, 0])
    cylinder(lens_height*2,
             m6_radius + shim,
             m6_radius + shim, $fn=fn);
    translate([0, lens_height*2, -m6_attach_radius + lens_height/2])
    rotate(a = 90, v = [1, 0, 0])
    cylinder(lens_height*2,
             m6_radius + shim,
             m6_radius + shim, $fn=fn);
  }
}

echo(version=version());

render();
