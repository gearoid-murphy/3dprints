fn = 128;
epoxy_width = 0.75;
lens_diameter = 25.4;
lens_radius = lens_diameter / 2.0;
lens_flange = 3.0;
optical_channel_radius = lens_radius - lens_flange;
housing_radius = lens_radius + epoxy_width;
housing_side_dim = lens_diameter + 5;
housing_height = 5;
lens_fitting_rim = 3;
flange_dim = 5;
thickness = 0.5;

module housing_body() {
  difference() {
    cube(size = [housing_side_dim, housing_side_dim, housing_height]);
    translate([housing_side_dim/2, housing_side_dim/2, 0])
    cylinder(h = housing_height,
             r1 = optical_channel_radius,
             r2 = optical_channel_radius, $fn=fn);
  }
}

module lens_rim() {
  translate([housing_side_dim/2, housing_side_dim/2, housing_height]) {
    difference() {
      cylinder(h = lens_fitting_rim,
               r1 = housing_radius+thickness,
               r2 = housing_radius+thickness, $fn=fn);
      cylinder(h = lens_fitting_rim,
               r1 = housing_radius,
               r2 = housing_radius, $fn=fn);
    }
  }
}

module housing_flange() {
  translate([-flange_dim/2, -flange_dim/2,
             housing_height-thickness]) {
    difference() {
      cube(size = [housing_side_dim+flange_dim,
                   housing_side_dim+flange_dim, thickness]);
      translate([flange_dim/2, flange_dim/2, 0])
      cube(size = [housing_side_dim, housing_side_dim, thickness]);
    }
  }
}

module render() {
  union() {
    housing_body();
    lens_rim();
    housing_flange();
  }
}


echo(version=version());

render();
