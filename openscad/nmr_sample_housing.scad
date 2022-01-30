module render()
{
  // Magnet width 25.5
  // Magnet length 50.1
  // Ferrite rod width 12
  // Ferrite rod length 30
  fn = 32;
  thickness = 1.5;
  magnet_length = 50.1;
  magnet_width = 25.5;
  sample_radius = 20.0 / 2.0;
  leg_depth = 10;
  rod_width = 20;
  rod_radius = rod_width / 2.0;
  rod_length = 20;
  coil_support_length = rod_length*2 + magnet_width;
  coil_support_depth = rod_radius + 2.5;
  
  difference() {
    union() {
      cube([magnet_length,
            magnet_width+thickness*2,
            leg_depth], false);
      coil_x_offset = magnet_length/2.0 - coil_support_depth/2.0;
      coil_y_offset = coil_support_length/2.0 - magnet_width/2.0 - thickness;
      translate([coil_x_offset, -coil_y_offset,
                 leg_depth - thickness])
      cube([coil_support_depth,
            coil_support_length,
            coil_support_depth], false);
      
    }
    translate([0, +thickness, -thickness])
    cube([magnet_length, magnet_width, leg_depth], false);
    
    cyl_x_offset = magnet_length/2.0;
    cyl_y_offset = leg_depth + coil_support_depth;
    cyl_z_offset = -coil_support_length/2.0 - magnet_width/2.0 - thickness;
    rotate(a=90, v=[1,0,0])
    translate([cyl_x_offset, cyl_y_offset, cyl_z_offset])
    cylinder(rod_length+3, rod_radius, rod_radius, $fn=fn);

    cyl_x_offset = magnet_length/2.0;
    cyl_y_offset = leg_depth + coil_support_depth;
    cyl_z_offset = -coil_support_length/2.0 - magnet_width/2.0 - thickness;
    rotate(a=90, v=[1,0,0])
    translate([cyl_x_offset, cyl_y_offset, -4.5])
    cylinder(rod_length+4, rod_radius, rod_radius, $fn=fn);    

    sample_x_offset = magnet_length/2.0 - sample_radius;
    sample_y_offset = magnet_width/2.0 - sample_radius/2;
    translate([sample_x_offset, sample_y_offset-2.5, leg_depth])
    cube([sample_radius*2,
          sample_radius*1.8,
          coil_support_depth], false); 

  }
}

echo(version=version());

render();
