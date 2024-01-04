height = 50;

dowel_diameter = 20;
outer_diameter = 40;

legs = 3;

module coat_rack() {
  difference() {
    hull()
    for(i = [0: 360/legs: 360]) {
      rotate([0, 0, i])
      translate([10, 0, 0])
        cylinder(d=outer_diameter, h=height, center=true);
    }
    
    for(i = [0: 360/legs: 360]) {
      rotate([0, 0, i])
      translate([10, 0, 0])
        cylinder(d=dowel_diameter, h=height, center=true);  
    }
  }
}

coat_rack();