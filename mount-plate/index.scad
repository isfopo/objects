use <../libraries/BOSL/shapes.scad>;

width = 80; // mm
depth = 140; // mm
thickness = 4; // mm

fillet = 4; // mm
padding = 6; //mm
screw_diameter = 3; // mm
screw_head_diameter = 6; // mm
screw_head_height = 4; // mm

inner_width = (width/2)-padding;
inner_depth = (depth/2)-padding;

$fn = 100;

module mount_plate() {
  difference() {
    cuboid([ width, depth, thickness ], fillet = fillet,
          edges = [ [ 0, 0, 0, 0 ], [ 0, 0, 0, 0 ], [ 1, 1, 1, 1 ] ]);


    translate([0,0, -thickness/2])
    union() {
      screw_hole([inner_width, inner_depth]);
      screw_hole([-inner_width, inner_depth]);
      screw_hole([inner_width, -inner_depth]);
      screw_hole([-inner_width, -inner_depth]);
    }
  }
  
  module screw_hole(location = [ 0, 0 ])
  {
      scale([ 1, 1, 1 ])
      {
        translate([ location[0], location[1], 0 ])
        union()
        {
          translate([ 0, 0, 0 ])
          cylinder(d1 = screw_head_diameter, d2 = screw_diameter, h = screw_head_height);
          cylinder(h = thickness, d = screw_diameter);
        }
      }

  }
}



mount_plate();