use <MCAD/regular_shapes.scad>
thickness = 1.0;
scaler = 1.5;
radius = 15;
small_radius = radius / 2.0;

large_height = (sqrt(3) / 2) * radius;
small_height = (sqrt(3) / 2) * small_radius;
translation_offset = (large_height - small_height);
echo(large_height=large_height);
fn = 128;


module render()
{
  triangle_prism(thickness, radius);
  translate([0, translation_offset, thickness])
  triangle_prism(thickness, small_radius);
}

echo(version=version());

render();
