vessel_width = 83;
vessel_length = 122;
t_radius = 30.0 / 2.0;
t_length = 38.0 - t_radius;
t_width = 23.7;
stand_height = 50;
thickness = 1.0;
fn = 128;

module t_shape(scaler) {
  scale([scaler, scaler, 1.0])
  union() {
    circle(t_radius);
    translate([0, -(t_width-t_radius), 0])
    square([t_length,t_width]);
  }  
}

module render()
{
  base_scale = 2.0;
  linear_extrude(height=stand_height, scale=0.5, $fn=fn)
  t_shape(base_scale);
}

echo(version=version());

render();
