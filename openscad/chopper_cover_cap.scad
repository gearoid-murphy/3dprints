fn = 128;

include <chopper_cover.scad>

cap_thickness = 1;
mount_aperture_size = 60;

module render() {
  difference() {
    difference() {
      cylinder(h = cap_thickness*2,
               r1 = shield_radius+cap_thickness,
               r2 = shield_radius+cap_thickness, $fn=fn);
      translate([0, 0, cap_thickness])
      cylinder(h = cap_thickness,
               r1 = shield_radius,
               r2 = shield_radius, $fn=fn);    
    }
    translate([-support_width/2, 0, 0])
    cube(size = [support_width, mount_aperture_size, 10]);
  }
}

echo(version=version());
render();
