use <common/prism.scad>

fn = 128;

// Hole width: 6.7mm
// Outer end-to-end: 57.5
// Inner end-to-end: 44.3
//
// Wheel outer radius: 1.9" (48.26 mm)
// Wheel inner radius: 1.325" (33.655mm)

margin = 10;
thickness = 2;
shim = 0.1;
hole_width = 6.7;
support_flange = 5;
base_to_center = 60;
center_to_chop = 43;
support_width = hole_width + support_flange*2;
support_length = base_to_center + center_to_chop;
support_height = 15;
inner_end_to_end = 44.3;
outer_end_to_end = 57.5;
hole_to_hole = inner_end_to_end+hole_width;
aperture_radius = 10 / 2;
wheel_center_offset = 60;
inner_wheel_radius = 40 / 2;
prism_length = support_length * 0.70;

module rotated_prism() {
  rotate(a=180, v=[0, 0, 1]) 
  prism(thickness, prism_length, support_height);
}

module support_module() {
  union() {
    translate([thickness, prism_length+thickness, 0])
    rotated_prism();
    translate([support_width, prism_length+thickness, 0])
    rotated_prism();
    cube([support_width, support_length, thickness]);
    difference() {
      cube([support_width, thickness, support_height]);
      translate([support_flange, 0, thickness])
      cube([hole_width, thickness, support_height-hole_width]);
    }
  }
}

module probe_module() {
  difference() {
    cube([hole_to_hole, support_width, thickness]);
    translate([hole_to_hole/2, support_width/2, -thickness])
    cylinder(thickness*3,
             aperture_radius,
             aperture_radius, $fn=fn);
  }
}

module render() {
  difference() {
    union() {
      echo(hole_to_hole=hole_to_hole);
      support_module();
      translate([hole_to_hole , 0, 0])
      support_module();
      translate([support_width/2, support_length - support_width/2, 0])
      probe_module();
    }
    translate([hole_to_hole/2 + support_width/2, wheel_center_offset, 0])
    cylinder(thickness*3,
             inner_wheel_radius,
             inner_wheel_radius, $fn=fn);
  }
}

echo(version=version());

render();
