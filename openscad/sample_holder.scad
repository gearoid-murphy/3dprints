fn = 128;
bowl_radius = 110 / 2;
base_radius = 60 / 2;
m4_radius = 4.75 / 2;
m4_mount_radius = 50 / 2;
support_radius = 40 / 2;
support_height = 20;
sample_square_size= 43;
sample_height = 10;
diffusion_gap = 6;
internal_thickness = 2;
external_thickness = 10;
rim_gap = 15;
well_depth = 0;
step_height = 6;
step_dim = 10;
bath_gap = 7.5;
well_radius = (sample_square_size - step_dim) / 2;
rim_height = sample_height + step_height;
bowl_depth = sample_height + diffusion_gap + step_height;
inner_cyro_height = bowl_depth;
inner_cyro_radius = ((sqrt(sample_square_size*sample_square_size*2) / 2) +
                     internal_thickness + bath_gap);
inner_cyro_slope_height = 7.5;


echo(inner_cyro_radius=inner_cyro_radius);


module sample_rim() {
  union() {
    difference() {
      cube(size = [sample_square_size + internal_thickness*2,
                   sample_square_size + internal_thickness*2,
                   rim_height]);
      translate([internal_thickness, internal_thickness, 0])
      cube(size = [sample_square_size,
                   sample_square_size,
                   rim_height]);
      translate([0, internal_thickness + sample_square_size/2 - rim_gap/2, 0])
      cube(size = [sample_square_size + internal_thickness*2,
                   rim_gap,
                   rim_height]);
      translate([internal_thickness + sample_square_size/2 - rim_gap/2, 0, 0])
      cube(size = [rim_gap,
                   sample_square_size + internal_thickness*2,
                   rim_height]);
    }
    translate([internal_thickness, internal_thickness, 0])
    cube(size = [step_dim, step_dim, step_height]);
    step_offset = internal_thickness + sample_square_size - step_dim;
    translate([step_offset, internal_thickness, 0])
    cube(size = [step_dim, step_dim, step_height]);
    translate([internal_thickness, step_offset, 0])
    cube(size = [step_dim, step_dim, step_height]);
    translate([step_offset, step_offset, 0])
    cube(size = [step_dim, step_dim, step_height]);
  }
}

module bowl() {
  union() {
    difference() {
      cylinder(h = bowl_depth + external_thickness,
               r1 = bowl_radius + external_thickness,
               r2 = bowl_radius + external_thickness, $fn=fn);
      translate([0, 0, external_thickness])
      cylinder(h = bowl_depth,
               r1 = bowl_radius,
               r2 = bowl_radius, $fn=fn);
    }
    translate([0, 0, external_thickness])
    difference() {
      
      cylinder(h = inner_cyro_height,
               r1 = bowl_radius,
               r2 = bowl_radius, $fn=fn);
      cylinder(h = inner_cyro_height,
               r1 = inner_cyro_radius,
               r2 = inner_cyro_radius, $fn=fn);
      translate([0, 0, inner_cyro_height-inner_cyro_slope_height])
      cylinder(h = inner_cyro_slope_height,
               r1 = inner_cyro_radius,
               r2 = bowl_radius+10, $fn=fn);

    }
    translate([0, 0, bowl_depth + external_thickness])
    difference() {
      cylinder(h = internal_thickness,
               r1 = bowl_radius + external_thickness,
               r2 = bowl_radius + external_thickness, $fn=fn);
      cylinder(h = internal_thickness,
               r1 = bowl_radius + external_thickness/2,
               r2 = bowl_radius + external_thickness/2, $fn=fn);
    }
    translate([
      -(internal_thickness + sample_square_size/2),
      -(internal_thickness + sample_square_size/2), external_thickness])
    sample_rim();
  }
}

module support() {
  cylinder(h = support_height,
           r1 = support_radius,
           r2 = support_radius, $fn=fn);
}

module base() {
  difference() {
    cylinder(h = internal_thickness,
             r1 = base_radius,
             r2 = base_radius, $fn=fn);
    translate([m4_mount_radius, 0, 0])
    cylinder(h = internal_thickness,
             r1 = m4_radius,
             r2 = m4_radius, $fn=fn);
    translate([-m4_mount_radius, 0, 0])
    cylinder(h = internal_thickness,
             r1 = m4_radius,
             r2 = m4_radius, $fn=fn);
    translate([0, m4_mount_radius, 0])
    cylinder(h = internal_thickness,
             r1 = m4_radius,
             r2 = m4_radius, $fn=fn);
    translate([0, -m4_mount_radius, 0])
    cylinder(h = internal_thickness,
             r1 = m4_radius,
             r2 = m4_radius, $fn=fn);
  }
}

module render() {
  difference() {
    union() {
      base();
      translate([0, 0, internal_thickness])
      support();
      translate([0, 0, internal_thickness + support_height])
      bowl();
    }
    well_z_offset = (internal_thickness + support_height +
                     external_thickness - well_depth);
    translate([0, 0, well_z_offset])
    cylinder(h = well_depth,
             r1 = well_radius,
             r2 = well_radius, $fn=fn);
  }
}

echo(version=version());

render();
