include <sample_holder.scad>
include <lateral_probe_support.scad>

fn = 128;

thickness = 0.5;
sample_dim = 40.5;
mask_height = 2;
pogo_pin_radius = 3 /2;

module render() {
  difference() {
    difference() {
      cube(size = [sample_dim+thickness*2,
                   sample_dim+thickness*2, mask_height],
           center=true);
      translate([0, 0, thickness])
      cube(size = [sample_dim, sample_dim, mask_height],
           center=true);
    }
    
    // angles = [0, 45, 90, 135, 180, 225, 270];
    angles = [0, 90, 180, 270];
    for(angle = angles) {
      rotate(a=angle, v=[0,0,1])
      translate([0, sample_dim*.3, -mask_height/2])
      probe_cylinders(0, 0, -thickness*2, mask_height, 0);
    }
  }
}

echo(version=version());

render();