fn = 128;
radius = 21.45;
thickness = 0.5;
aperture_radius = 2;

module render()
{
  difference() {
    cylinder(h = thickness,
             r1 = radius,
             r2 = radius, $fn=fn);
    cylinder(h = thickness,
             r1 = aperture_radius,
             r2 = aperture_radius, $fn=fn);
  }
}

echo(version=version());

render();
