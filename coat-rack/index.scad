height = 40; // mm
dowel_length = 1000; // mm

dowel_diameter = 20; // mm
outer_diameter = 35; // mm
wall_thickness = (outer_diameter-dowel_diameter)/2;

spacing = 25; // mm

outward_angle = 10; // deg
side_angle = 10; // deg

legs = 3;

screw_diameter = 4;
screw_head_diameter = 8;
screw_head_height = 2;

$fn = 10;

module coat_rack() {
  difference() {
    hull() 
    for(i = [0: 360/legs: 360]) {
      rotate([side_angle, outward_angle, i])
      translate([spacing, 0, 0])
        cylinder(d=outer_diameter, h=height, center=true);
    }
    
    for(i = [0: 360/legs: 360]) {
      rotate([side_angle, outward_angle, i])
      translate([spacing, 0, 0])
      rotate([0, 0, 90])
        union() {
          cylinder(d=dowel_diameter, h=dowel_length, center=true, $fn = 20);  
          rotate([90, 0, 0])
          translate([0, 0, dowel_diameter/2])
          union() {
            cylinder(d=screw_diameter, h=wall_thickness);
            translate([0, 0, wall_thickness - (screw_head_height/2)])
            cylinder(d1=screw_diameter, d2=screw_head_diameter, h=screw_head_height, center=true);
          }
        }
    }
  }
}

coat_rack();