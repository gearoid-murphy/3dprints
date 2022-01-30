oil_vessel_length = 142;
oil_vessel_width = 102;
oil_vessel_height = 10;
t_length = 38.0;
t_width = 30.0;
b_length = 45;
b_width = 33;
margin = 5;
total_length = (margin + oil_vessel_length +
                margin + b_length + margin);
total_width = oil_vessel_width + margin*2;
thickness = 2;
wall_width = 1;
fn = 128;

module render() {
  union() {
    cube([total_length, total_width, thickness]);
    translate([margin, margin, thickness]) {
      difference() {
        cube([oil_vessel_length + wall_width*2,
              oil_vessel_width + wall_width*2,
              oil_vessel_height]);
        translate([wall_width, wall_width, 0])
        cube([oil_vessel_length,
              oil_vessel_width,
              oil_vessel_height]);
      }
    }
  }
}

echo(version=version());

render();
