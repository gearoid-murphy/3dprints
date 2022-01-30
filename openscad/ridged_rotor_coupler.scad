module render() {
  fn = 16;
  thickness = 0.75;
  expansion_fudge = 0.5;
  shaft_radius = (6 + expansion_fudge) / 2.0;
  coupler_thickness = 2;
  coupler_radius = shaft_radius + coupler_thickness;
  coupler_length = 12.5;
  // plate_radius = 170.0 / 2.0;
  plate_radius = 50.0 / 2.0;
  ridge_margin = 5.0;
  ridge_len = (plate_radius * 2.0);
  ridge_dim = 0.5;
  ridge_radius = 100.0 / 2.0;
  rotate(a=180, v=[1,0,0])
  difference() {
    union() {
      cylinder(h = coupler_length,
               r1 = coupler_radius,
               r2 = coupler_radius, $fn=fn);
      for(rot = [0 : 22.5 : 337.5]) {
        rotate(a=rot, v=[0,0,1])
        translate([-ridge_len/2.0,
                   -ridge_dim/2.0,
                   coupler_length-ridge_dim]) {
          cube(size = [ridge_len, ridge_dim, ridge_dim]);
        }
      }

      translate([0, 0, coupler_length-ridge_dim]) {
        difference() {
          cylinder(h = ridge_dim,
                   r1 = ridge_radius,
                   r2 = ridge_radius, $fn=fn);
          cylinder(h = ridge_dim,
                   r1 = ridge_radius-ridge_dim,
                   r2 = ridge_radius-ridge_dim, $fn=fn);
        }
      }

      translate([0, 0, coupler_length]) {
        cylinder(h = thickness,
                 r1 = plate_radius,
                 r2 = plate_radius, $fn=fn);
      }
    }
    cylinder(h = coupler_length - thickness,
             r1 = shaft_radius,
             r2 = shaft_radius, $fn=fn);
  }
}

// Render main
echo(version=version());
render();
