expansion_fudge = 0.5;
motor_coupler_length = 15;
motor_shaft_radius = (5 + expansion_fudge) / 2.0;

drive_shaft_length = 15;
drive_shaft_radius = (6 + expansion_fudge) / 2.0;

thickness = 3;

fn = 128;


module coupler(shaft_length, shaft_radius, thickness) {
  difference() {
    cylinder(h = shaft_length + thickness,
             r1 = shaft_radius + thickness,
             r2 = shaft_radius + thickness, $fn=fn);
    cylinder(h = shaft_length,
             r1 = shaft_radius,
             r2 = shaft_radius, $fn=fn);
  }
}

module render()
{
  rotate(a=180, v=[1,0,0]) {
    translate([0, 0, -motor_coupler_length]) {
      coupler(motor_coupler_length,
              motor_shaft_radius,
              thickness);
    }
    rotate(a=180, v=[1,0,0])
    translate([0, 0, -(drive_shaft_length)])
    {
      coupler(drive_shaft_length,
              drive_shaft_radius,
              thickness);
    }
  }
}

echo(version=version());

render();
