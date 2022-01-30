module render()
{
  // heights
  base_height = 5;
  inner_offset = 2;
  inner_height = base_height - inner_offset;

  stem_height = base_height * 3;
  stem_radius = 1.8;

  stem_reinforcement_height = base_height/3;
  stem_reinforcement_radius = stem_radius*3;

  // radii
  bottom_flare_radius = 60;
  base_radius = bottom_flare_radius - 10;
  inner_radius = base_radius-1;
  
  top_flare_height = 5;
  total_height = base_height + top_flare_height;
  // hole
  hole_depth = stem_height * (1.0) ;
  hole_radius = 1.0;
  fn = 128;

  union() {
    difference() {
      translate([0, 0, base_height])
      cylinder(h = top_flare_height,
              r1 = base_radius,
              r2 = base_radius+top_flare_height , $fn=fn);
      union() {
        translate([0, 0, base_height - 0.1])
        cylinder(h = 1.1,
                 r1 = base_radius-1,
                 r2 = base_radius , $fn=fn);
        translate([0, 0, base_height+1])
        cylinder(h = top_flare_height,
                r1 = base_radius,
                r2 = base_radius+top_flare_height , $fn=fn);
      }
    }
    difference() {
      union() {
        difference() {
          cylinder(h = base_height,
                   r1 = base_radius,
                   r2 = base_radius, $fn=fn);
          translate([0, 0, inner_offset])
          cylinder(h = inner_height+1,
                   r1 = inner_radius,
                   r2 = inner_radius, $fn=fn);
        }
        cylinder(h = stem_height,
                 r1 = stem_reinforcement_radius,
                 r2 = stem_radius, $fn=fn);
        cylinder(h = 1,
                 r1 = bottom_flare_radius,
                 r2 = bottom_flare_radius, $fn=fn);

      }
      translate([0, 0, stem_height - hole_depth])
      cylinder(h = hole_depth + 1,
              r1 = hole_radius,
              r2 = hole_radius , $fn=fn);
    }
  }
  echo(total_height=total_height);
}

echo(version=version());


render();
