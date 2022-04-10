use <common/prism.scad>

fn = 128;
inner_width = 100;
rail_edge_width = 9;
rail_thickness = 25;
flange_thickness = 2.5;
width = 8;
base_length = inner_width + rail_thickness*2;
m6_radius = 6.2 / 2;
total_height = 25.5;
m6_depth = 10;
nut_width = 10.4;
nut_height=3.2;
attach_point_height = total_height-flange_thickness;

module attach_point() {
  difference() {
    cube(size = [rail_thickness, width, attach_point_height]);
    translate([
      rail_thickness/2,
      width/2,
      attach_point_height-m6_depth
    ])
    cylinder(h = m6_depth,
          r1 = m6_radius,
          r2 = m6_radius, $fn=fn);
    translate([
      rail_thickness/2-nut_width/2,
      0,
      attach_point_height-m6_depth/2
    ])
    cube(size = [nut_width, width, nut_height]);
  }
}

module render() {
  union() {
    translate([0, 0, flange_thickness])
    attach_point();
    translate([base_length-rail_thickness, 0, flange_thickness])
    attach_point();
    cube(size = [base_length, width, flange_thickness]);
  }
}

echo(version=version());

render();
