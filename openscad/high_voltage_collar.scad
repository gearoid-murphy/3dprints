ball_diameter = 38.0 + 2.0; // add 2 for materials coarseness
ball_radius = ball_diameter / 2.0;
bottom_box_dim = ball_diameter*1.2;
collar_height = 10.0;
stem_diameter = 6.0;
stem_radius = stem_diameter / 2.0;
stem_length = 8.0;
thickness = 1.0;
enlarged_radius = stem_radius + thickness;
fn = 128;

module render(){
  difference() {
    union() {
      sphere(ball_radius + thickness, $fn=fn);
      translate([ball_radius - 1.0, 0, collar_height / 2.0])
      rotate(a=90, v=[0,1,0])
      cylinder(stem_length, enlarged_radius, enlarged_radius, $fn=fn);
    }
    sphere(ball_radius, $fn=fn);
    translate([-bottom_box_dim/2.0,
               -bottom_box_dim/2.0,
               -ball_diameter])
    cube([bottom_box_dim, bottom_box_dim, ball_diameter]);
    translate([-bottom_box_dim/2.0,
               -bottom_box_dim/2.0,
               collar_height])
    cube([bottom_box_dim, bottom_box_dim, ball_diameter]);
    translate([ball_radius, 0, collar_height / 2.0])
    rotate(a=90, v=[0,1,0]) {
      translate([0, 0, -stem_radius])
      cylinder(stem_length*2.0, stem_radius, stem_radius, $fn=fn);
    }
  }
}

echo(version=version());

render();
