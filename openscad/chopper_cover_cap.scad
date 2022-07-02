fn = 128;

include <chopper_cover.scad>

cap_thickness = 1;
cap_radius = shield_radius+thickness;
mount_aperture_size = 90;
shim = 0.3;

echo(cap_radius=cap_radius);

module render() {
  difference() {
    difference() {
      cylinder(h = cap_thickness*2,
               r1 = cap_radius+cap_thickness,
               r2 = cap_radius+cap_thickness, $fn=fn);
      translate([0, 0, cap_thickness])
      cylinder(h = cap_thickness,
               r1 = cap_radius+shim,
               r2 = cap_radius+shim, $fn=fn);    
    }
    translate([-support_width/2, -13, 0])
    cube(size = [support_width, mount_aperture_size, 10]);
    translate([-aperture_size/2,
               -aperture_size/2 - aperture_offset,
               -v_mount_height/2])
    cube(size = [aperture_size, aperture_size, v_mount_height]);
  }
}

echo(version=version());
render();
