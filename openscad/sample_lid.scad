include <lateral_probe_support.scad>
include <sample_holder.scad>

fn = 128;

lid_y_offset_shim = 1;
lid_half_hyp = sqrt(2*heatsink_square_size*heatsink_square_size)/2;
lid_y_offset = lid_half_hyp/2 - lid_y_offset_shim;
// lid_z_offset = bowl_depth + thickness;
lid_z_offset = 0;
lid_radius = bowl_radius + 1;
lid_thickness = 0.5;

spout_radius = 18/ 2 ;
spout_height = 10;
spout_shim = 1;
spout_y_offset = (heatsink_square_size / 2) + spout_radius + spout_shim;
spout_thickness = 0.5;

module render() {
  if(false) {
    rotate(a=90, v=[0, 0, 1]) {
      bowl();
    }
  }
  
  difference() {
      translate([0, 0, lid_z_offset])
      union() {
        translate([0, 0, lid_z_offset])
        cylinder(h = lid_thickness,
                 r1 = lid_radius,
                 r2 = lid_radius, $fn=fn);

        translate([0, -spout_y_offset, lid_z_offset])
        // Useful ellipse trick
        scale([1.2, 0.85])
        cylinder(h = spout_height,
                 r1 = spout_radius+spout_thickness,
                 r2 = spout_radius+spout_thickness, $fn=fn);
      }
   
      translate([0, -spout_y_offset, lid_z_offset - lid_thickness ])
      scale([1.2, 0.85])
      cylinder(h = spout_height + lid_thickness + spout_thickness,
               r1 = spout_radius,
               r2 = spout_radius, $fn=fn);
      probe_cylinders(0, lid_y_offset, lid_z_offset- total_probe_height/2);
  }
}

// render();