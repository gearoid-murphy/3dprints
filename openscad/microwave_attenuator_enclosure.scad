fn = 128;

thickness = 1;
gap = 10;
sample_x = 97 + gap;
sample_y = 20;
sample_z = 65;
aperture_radius = 15/2;
aperture_x_off = thickness + gap/2 + 80;
aperture_y_off = thickness*1.5;
aperture_z_off = 50;

module render() {
  difference() {
    difference() {
      cube(size = [sample_x+thickness*2,
                   sample_y+thickness*2, sample_z]);
      translate([thickness, thickness, thickness])
      cube(size = [sample_x, sample_y, sample_z]);
    }
    translate([aperture_x_off,
               aperture_y_off,
               aperture_z_off])
    rotate(a=90, v=[1, 0, 0])
    cylinder(h = thickness*3,
             r1 = aperture_radius,
             r2 = aperture_radius, $fn=fn);    
  }
}

echo(version=version());

render();