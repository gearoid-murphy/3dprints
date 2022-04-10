fn = 128;
bowl_radius = 80 / 2;
base_radius = 60 / 2;
m4_radius = 4.2 / 2;
m4_mount_radius = 50 / 2;
support_radius = 30 / 2;
support_height = 25;
heatsink_height = 10;
heatsink_square_size= 40.1;
sample_height = 10;
bowl_depth = heatsink_height + sample_height;
thickness = 1.5;
rim_height = heatsink_height + sample_height*0.75;
rim_gap = 15;

module sample_rim() {
  difference() {
    cube(size = [heatsink_square_size + thickness*2,
                 heatsink_square_size + thickness*2,
                 rim_height]);
    translate([thickness, thickness, 0])
    cube(size = [heatsink_square_size,
                 heatsink_square_size,
                 rim_height]);
    translate([0, thickness + heatsink_square_size/2 - rim_gap/2, 0])
    cube(size = [heatsink_square_size + thickness*2,
                 rim_gap,
                 rim_height]);
    translate([thickness + heatsink_square_size/2 - rim_gap/2, 0, 0])
    cube(size = [rim_gap,
                 heatsink_square_size + thickness*2,
                 rim_height]);
  }
}

module bowl() {
  union() {
    difference() {
      cylinder(h = bowl_depth + thickness,
               r1 = bowl_radius + thickness,
               r2 = bowl_radius + thickness, $fn=fn);
      translate([0, 0, thickness])
      cylinder(h = bowl_depth,
               r1 = bowl_radius,
               r2 = bowl_radius, $fn=fn);
    }
    translate([
      -(thickness + heatsink_square_size/2),
      -(thickness + heatsink_square_size/2), 0])
    sample_rim();
  }
}

module support() {
  cylinder(h = support_height,
           r1 = support_radius,
           r2 = support_radius, $fn=fn);
}

module base() {
  difference() {
    cylinder(h = thickness,
             r1 = base_radius,
             r2 = base_radius, $fn=fn);
    translate([m4_mount_radius, 0, 0])
    cylinder(h = thickness,
             r1 = m4_radius,
             r2 = m4_radius, $fn=fn);
    translate([-m4_mount_radius, 0, 0])
    cylinder(h = thickness,
             r1 = m4_radius,
             r2 = m4_radius, $fn=fn);
    translate([0, m4_mount_radius, 0])
    cylinder(h = thickness,
             r1 = m4_radius,
             r2 = m4_radius, $fn=fn);
    translate([0, -m4_mount_radius, 0])
    cylinder(h = thickness,
             r1 = m4_radius,
             r2 = m4_radius, $fn=fn);
  }
}

module render() {
  union() {
    base();
    translate([0, 0, thickness])
    support();
    translate([0, 0, thickness + support_height])
    bowl();
    
    
  }
}

echo(version=version());

render();