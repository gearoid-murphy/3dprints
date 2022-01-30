module render()
{
  corrective_shim = 0.2;
  cube_dim = 12.7 + corrective_shim;
  margin = 5;
  inner_hyp = cube_dim * 2.2;
  inner_radius = sqrt((inner_hyp*inner_hyp)/2.0);
  disk_radius = inner_radius + cube_dim/2.0 + margin;
  diag_radius = inner_radius * 0.70710678118; // sin 45 degrees
  sample_area_radius = 20 / 2.0;
  thickness = 15;
  fn = 128;

  rotate(a=180, v=[1,0,0])
  difference() {
    cylinder(h = thickness,
             r1 = disk_radius,
             r2 = disk_radius, $fn=fn);
    union() {
      translate([inner_radius, 0, cube_dim/2])
      cube(size = [cube_dim, cube_dim, cube_dim], center=true);
      translate([-inner_radius, 0, cube_dim/2])
      cube(size = [cube_dim, cube_dim, cube_dim], center=true);
      translate([0, inner_radius, cube_dim/2])
      cube(size = [cube_dim, cube_dim, cube_dim], center=true);
      translate([0, -inner_radius, cube_dim/2])
      cube(size = [cube_dim, cube_dim, cube_dim], center=true);

      translate([diag_radius, diag_radius, cube_dim/2])
      cube(size = [cube_dim, cube_dim, cube_dim], center=true);
      translate([-diag_radius, diag_radius, cube_dim/2])
      cube(size = [cube_dim, cube_dim, cube_dim], center=true);
      translate([diag_radius, -diag_radius, cube_dim/2])
      cube(size = [cube_dim, cube_dim, cube_dim], center=true);
      translate([-diag_radius, -diag_radius, cube_dim/2])
      cube(size = [cube_dim, cube_dim, cube_dim], center=true);

      cylinder(h = thickness,
         r1 = sample_area_radius,
         r2 = sample_area_radius, $fn=fn);
    }
  }
}

echo(version=version());

render();
