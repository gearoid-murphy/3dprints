module render()
{
  disk_radius = 89.0 / 2.0;
  thickness = 1.0;
  fn = 256;

  cylinder(h = thickness,
           r1 = disk_radius,
           r2 = disk_radius, $fn=fn);
}

echo(version=version());

render();
