height = 50; // mm

dowel_diameter = 20; // mm
outer_diameter = 40; // mm

spacing = 20; // mm

outward_angle = 10; // deg
side_angle = 10; // deg

legs = 3;

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
        cylinder(d=dowel_diameter, h=height+ 100, center=true);  
    }
  }
}

coat_rack();