height = 40; // mm
coupler_height = height;
foot_height = height;
dowel_length = 1000; // mm

dowel_diameter = 20; // mm
outer_diameter = 35; // mm
wall_thickness = (outer_diameter-dowel_diameter)/2;

spacing = 25; // mm

outward_angle = 10; // deg
side_angle = 10; // deg

hook_height = 30;
hook_diameter = 10; // mm
hook_length = 70; // mm
hook_angle = 30; // deg

legs = 3;

screw_diameter = 4;
screw_head_diameter = 8;
screw_head_height = 2;

$fn = 100;

outer_fn = 9;

part="hook"; // "connector" | "coupler" | "foot" | "top" | "hook"

module connector() {
  difference() {
    hull() 
    for(i = [0: 360/legs: 360]) {
      rotate([side_angle, outward_angle, i])
      translate([spacing, 0, 0])
        cylinder(d=outer_diameter, h=height, center=true, $fn=outer_fn);
    }
    
    for(i = [0: 360/legs: 360]) {
      rotate([side_angle, outward_angle, i])
      translate([spacing, 0, 0])
      rotate([0, 0, 90])
        union() {
          cylinder(d=dowel_diameter, h=dowel_length, center=true);  
          rotate([90, 0, 0])
          translate([0, 0, dowel_diameter/2])
          screw_hole();
        }
    }
  }
}

module coupler() {
  difference() { 
    cylinder(d=outer_diameter, h=coupler_height, center=true, $fn=outer_fn);
    union() {
      cylinder(d=dowel_diameter, h=coupler_height, center=true);
      translate([0, (dowel_diameter/2)- (screw_head_height/2), coupler_height/4])
      rotate([-90, 0, 0])
      screw_hole(center=false);
    }
    union() {
      cylinder(d=dowel_diameter, h=coupler_height, center=true);
      translate([0, (dowel_diameter/2)- (screw_head_height/2), -coupler_height/4])
      rotate([-90, 0, 0])
      screw_hole(center=false);
    }
  }
}

module foot() {
  difference() {
    union() {
      sphere(d=outer_diameter, $fn=outer_fn);
      cylinder(d=outer_diameter, h=foot_height, $fn=outer_fn);
    }
      cylinder(d=dowel_diameter, h=foot_height);
      translate([0, (dowel_diameter/2)- (screw_head_height/2), foot_height/2])
      rotate([-90, 0, 0])
      screw_hole(center=false);
  }
}

module top() {}

module hook() {
  difference() {
    hull() {
      cylinder(d=outer_diameter, h=hook_height, center=true, $fn=outer_fn);
      translate([outer_diameter/2, 0, 0])
      rotate([side_angle, hook_angle, 0])
      cylinder(d=hook_diameter, h=hook_length, $fn=outer_fn);
    }
    cylinder(d=dowel_diameter, h=dowel_length, center=true);

    translate([-(dowel_diameter/2) + (screw_head_height/2), 0, 0])
    rotate([0, -90, 0])
    screw_hole(center=false);
  }
}

module screw_hole(center=true) {
  union() {
    cylinder(d=screw_diameter, h=wall_thickness);
    translate([0, 0, wall_thickness - (screw_head_height/2)])
    cylinder(d1=screw_diameter, d2=screw_head_diameter, h=screw_head_height, center=center);
  }
}

if (part == "connector"){
  connector();
} 

if (part == "coupler"){
  coupler();
}

if (part == "foot"){
  foot();
}

if (part == "top"){
  top();
}

if (part == "hook"){
  hook();
}

