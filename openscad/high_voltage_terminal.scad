flange_radius = 75.0 / 2.0;
flange_thickness = 1.0;
support_thickness = 30.0;
support_radius = 30.0 / 2.0;
cradle_radius = 25.0 / 2.0;
ball_radius = 38.0 / 2.0;
cradle_stand_radius = 2.0;
cradle_stand_height = ball_radius - sqrt(
                        (ball_radius*ball_radius) -
                        (cradle_radius*cradle_radius)
                       );

echo(cradle_stand_height=cradle_stand_height);
fn = 256;

module insulator_unit(offset) {
  unit_offset = (
    (flange_thickness+support_thickness) * offset);
  echo(unit_offset=unit_offset);
  translate([0, 0, unit_offset]) {
    cylinder(h = flange_thickness,
             r1 = flange_radius,
             r2 = flange_radius, $fn=fn);
    translate([0, 0, flange_thickness])
    cylinder(h = support_thickness,
             r1 = support_radius,
             r2 = support_radius, $fn=fn);
  }
}

module cradle_stand(x_mod, y_mod) {
  translate([cradle_radius*x_mod,
             cradle_radius*y_mod, 0])
  cylinder(h = cradle_stand_height,
           r1 = cradle_stand_radius,
           r2 = cradle_stand_radius, $fn=fn);
}

module cradle_unit(offset) {
  unit_offset = (
    (flange_thickness+support_thickness) * offset);
  echo(unit_offset=unit_offset);
  translate([0, 0, unit_offset]) {
    translate([cradle_radius, 0, 0])
    cylinder(h = cradle_stand_height,
             r1 = cradle_stand_radius,
             r2 = cradle_stand_radius, $fn=fn);
    cradle_stand(+1, 0);
    cradle_stand(-1, 0);
    cradle_stand(0, +1);
    cradle_stand(0, -1);
  }
}

module render(){
  insulator_unit(0);
  insulator_unit(1);
  insulator_unit(2);
  insulator_unit(3);
  cradle_unit(4);
}

echo(version=version());

render();
