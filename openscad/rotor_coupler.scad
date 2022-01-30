module render() {
  fn = 128;
  thickness = 1.0; // 1.75;
  expansion_fudge = 0.5;
  shaft_radius = (6 + expansion_fudge) / 2.0;
  coupler_thickness = 3;
  coupler_radius = shaft_radius + coupler_thickness;
  coupler_length = 10;
  stabilizer_length = coupler_length / 3;
  stabilizer_radius = 25;
  
  plate_radius = 250.0 / 2.0;

  rotate(a=180, v=[1,0,0])
  difference() {
    union() {
      cylinder(h = coupler_length,
               r1 = coupler_radius,
               r2 = coupler_radius, $fn=fn);
      translate([0, 0, coupler_length-stabilizer_length]) {
        cylinder(h = stabilizer_length,
                 r1 = stabilizer_radius,
                 r2 = stabilizer_radius, $fn=fn);
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
