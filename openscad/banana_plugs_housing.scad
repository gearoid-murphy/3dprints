plug_depth = 15;
plug_diameter = 9.0;
plug_radius = plug_diameter / 2.0;
access_height = 10;
access_width = 15;
base_height = 5.0;
plug_margin = 10;
num_plugs = 5;
height = base_height + access_height + plug_depth;
length = ((num_plugs-1)*(plug_margin+plug_diameter) +
          plug_margin*2);
width = 20;


margin = width/2;
hole_radius = 1.2;
fn = 128;

module render()
{
  difference() {
    cube(size = [length, width, height]);
    translate([0, 0, height-plug_depth-access_height]) {
      cube(size = [length, access_width, access_height]);
    }
    for (plug_index = [0:num_plugs-1]) {
      length_offset = plug_margin + (
                      plug_index*(plug_margin+plug_diameter));
      width_offset = access_width / 2.0;
      height_offset = base_height + access_height;
      translate([length_offset , width_offset, height_offset]) {
        cylinder(h = plug_depth,
                 r1 = plug_radius,
                 r2 = plug_radius, $fn=fn);
      }
    }
  }
  
}

echo(version=version());

render();
