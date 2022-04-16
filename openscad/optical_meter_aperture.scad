fn = 128;
shim = 0.3;
radius = (21.45 - shim) / 2;
thickness = 1.0;
aperture_radius = 1.5;

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
