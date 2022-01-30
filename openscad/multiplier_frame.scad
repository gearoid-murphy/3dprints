stages = 5;
hole_count= stages + 1;
inter_hole_offset = 16.5;
hole_boundary_margin_a = 5;
hole_boundary_margin_b = (hole_boundary_margin_a +
                          inter_hole_offset / 2);
hole_radius = 1.4;
ladder_width = 30;
ladder_margin = 7.5;

length= (hole_boundary_margin_a +
         hole_boundary_margin_b + stages*inter_hole_offset);
width = ladder_width + ladder_margin * 2;
height = 2.0;
fn = 64;


module render()
{
  difference() {
    cube(size = [length ,width , height]);
    for ( i = [0 : stages] ){
        translate([hole_boundary_margin_a + i*inter_hole_offset,
                   ladder_margin, -0.5])
        cylinder(h = height + 1,
                 r1 = hole_radius,
                 r2 = hole_radius, $fn=fn);
        translate([hole_boundary_margin_b + i*inter_hole_offset,
                   ladder_margin+ladder_width, -0.5])
        cylinder(h = height + 1,
                 r1 = hole_radius,
                 r2 = hole_radius, $fn=fn);    
    }
  }
}

echo(version=version());
echo(length=length);

render();
