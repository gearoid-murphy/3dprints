module render()
{
  fn = 256;
  expansion_fudge = 0.5;
  base_depth = 2.5;
  hull_height = 15;
  base_radius = ((98.2) - expansion_fudge) / 2.0;
  bottom_radius = 55 / 2.0;
  top_radius = 40 / 2.0; 
  
  
  cylinder(h=base_depth, r1=base_radius,
           r2=base_radius, center=false, $fn=fn);
  translate([0, 0, base_depth])
  cylinder(h=hull_height, r1=bottom_radius,
           r2=top_radius, center=false, $fn=fn);
  
 
}

echo(version=version());

render();
