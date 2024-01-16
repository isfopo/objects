inner_diameter = 90; // mm
outer_diameter = 100; // mm

base_height = 3; // mm
top_height = 6; // mm

$fn = 100;

module coaster() {
  difference() {
    cylinder(d = outer_diameter, h=top_height);
    translate([0, 0, base_height])
    cylinder(d = inner_diameter, h=top_height - base_height);
  }
}

coaster();