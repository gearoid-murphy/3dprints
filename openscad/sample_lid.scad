include <lateral_probe_support.scad>
include <sample_holder.scad>

fn = 128;

lid_y_offset_shim = 1;
lid_half_hyp = sqrt(2*sample_square_size*sample_square_size)/2;
lid_y_offset = lid_half_hyp/2 - lid_y_offset_shim;
// lid_z_offset = bowl_depth + thickness;
lid_z_offset = 0;
// 0.75 is the absolute max on super quality
lid_radius = (bowl_radius + 0.6 +
             (external_thickness / 2) - internal_thickness/2);
echo(lid_radius=lid_radius);
lid_thickness = 3.5;

spout_radius = 20 / 2 ;
spout_height = 7.5;
spout_shim = 1;
spout_y_offset = ((sample_square_size * .65 ) +
                  spout_radius + spout_shim);
spout_thickness = 1.0;
tube_radius = 6.5 / 2;

echo(internal_thickness=internal_thickness);
echo(external_thickness=external_thickness);
echo(lid_radius=lid_radius);
echo(lid_diameter=lid_radius*2);
echo(lid_diameter=lid_radius*2);

module render() {
  if(false) {
    rotate(a=90, v=[0, 0, 1]) {
      bowl();
    }
  }
  
  difference() {
      translate([0, 0, lid_z_offset])
      union() {
        cylinder(h = lid_thickness,
                 r1 = lid_radius,
                 r2 = lid_radius, $fn=fn);
        translate([0, -spout_y_offset, lid_z_offset])
        scale([1.29, 1])
        cylinder(h = spout_height + lid_thickness + spout_thickness,
                 r1 = spout_radius + spout_thickness,
                 r2 = spout_radius + spout_thickness, $fn=fn);

      }
   
      translate([0, -spout_y_offset, lid_z_offset])
      scale([1.29, 1])
      cylinder(h = spout_height + lid_thickness + spout_thickness,
               r1 = spout_radius,
               r2 = spout_radius, $fn=fn);
      probe_cylinders(0, lid_y_offset,  lid_z_offset, lid_thickness);
      translate([lid_radius/1.5, 0, 0])
      cylinder(h = spout_height + lid_thickness + spout_thickness,
               r1 = tube_radius,
               r2 = tube_radius, $fn=fn);
  }
}

// render();