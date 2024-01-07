use <../libraries/BOSL/shapes.scad>;

height = 50; // mm
leg_length = 1000; // mm

leg_diameter = 38.1; // mm
outer_diameter = 65; // mm
wall_thickness = (outer_diameter-leg_diameter)/2;

spacing = 40; // mm

outward_angle = 10; // deg
side_angle = 16; // deg

coupler_height = height;
coupler_has_hook = true;

hook_height = 30;
hook_diameter = 10; // mm
hook_length = 70; // mm
hook_angle = 30; // deg

top_height = height;
top_sphere = 70; // mm

foot_height = height;

shelf_height = height;
shelf_length = 30; // mm
shelf_screw_inset = 10; // mm
shelf_screw_angle = 30; // deg
shelf_screw_extend = 2.8; // mm

legs = 3;
leg_type = "baluster"; // "dowel" | "baluster"
leg_fillet=5; //mm

screw_diameter = 4;
screw_head_diameter = 8;
screw_head_height = 2;

$fn = 20;

outer_fn = 9;

part = "coupler"; // "connector" | "coupler" | "foot" | "top" | "hook" | "shelf"

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
          leg();
          rotate([90, 0, 0])
          translate([0, 0, leg_diameter/2])
          screw_hole();
        }
    }
  }
}

module coupler(has_hook = false) {
  difference() {
    if (has_hook) {
      hull() {
        cylinder(d=outer_diameter, h=coupler_height, center=true, $fn=outer_fn);
        translate([outer_diameter/2, 0, 0])
        rotate([side_angle, hook_angle, 0])
        cylinder(d=hook_diameter, h=hook_length, $fn=outer_fn);
      }
    } else {
      cylinder(d=outer_diameter, h=coupler_height, center=true, $fn=outer_fn);
    }

    union() {
      leg();

      translate([-(leg_diameter/2) + (screw_head_height/2), 0, coupler_height/4])
      rotate([0, -90, 0])
      screw_hole(center=false);

      translate([-(leg_diameter/2) + (screw_head_height/2), 0, -coupler_height/4])
      rotate([0, -90, 0])
      screw_hole(center=false);
    }
  }
}

module foot() {
  difference() {
    hull() {
      sphere(d=outer_diameter, $fn=outer_fn);
      cylinder(d=outer_diameter, h=foot_height, $fn=outer_fn);
    }
    leg(through=false);
    translate([-(leg_diameter/2) + (screw_head_height/2), 0, foot_height/2])
    rotate([0, -90, 0])
    screw_hole(center=false);
  }
}

module top() {
  difference() {
    hull() {
      cylinder(d=outer_diameter, h=top_height, center=true, $fn=outer_fn);
      translate([outer_diameter/2, 0, 0])
      rotate([side_angle, hook_angle, 0])
      cylinder(d=hook_diameter, h=hook_length, $fn=outer_fn);
    }
    translate([0, 0, -leg_length])
    leg(through=false);

    translate([-(leg_diameter/2) + (screw_head_height/2), 0, -top_height/4])
    rotate([0, -90, 0])
    screw_hole(center=false);
  }
}

module hook() {
  difference() {
    hull() {
      cylinder(d=outer_diameter, h=hook_height, center=true, $fn=outer_fn);
      translate([outer_diameter/2, 0, 0])
      rotate([side_angle, hook_angle, 0])
      cylinder(d=hook_diameter, h=hook_length, $fn=outer_fn);
    }
    leg();

    translate([-(leg_diameter/2) + (screw_head_height/2), 0, 0])
    rotate([0, -90, 0])
    screw_hole(center=false);
  }
}

module shelf() {
  difference() {
    hull() {
      cylinder(d=outer_diameter, h=shelf_height, center=true, $fn=outer_fn);
      translate([outer_diameter/2, 0, 0])
      rotate([0, 90, 0])
      cylinder(d=hook_diameter, h=shelf_length, $fn=outer_fn);
    }
    leg();

    translate([-(leg_diameter/2) + (screw_head_height/2), 0, 0])
    rotate([0, -90, 0])
    screw_hole(center=false);

    rotate([side_angle, 0, 0])
    translate([outer_diameter/2, -outer_diameter/2, 0])
    cube([shelf_length, outer_diameter, shelf_height]);

    translate([(shelf_length + (outer_diameter/2)) - shelf_screw_inset, 0, shelf_screw_extend/2])
    rotate([180+side_angle, -shelf_screw_angle, 0])
    screw_hole(extend=shelf_screw_extend);
  }
}

module leg(through=true) {
  if (leg_type == "dowel") {
    dowel(through=through);
  }
  
  if (leg_type == "baluster") {
    baluster(through=through);
  }
}

module dowel(through=true) {
  cylinder(d=leg_diameter, h=leg_length, through=through);
}

module baluster(through=true) {
  cuboid([leg_diameter, leg_diameter, leg_length], fillet=leg_fillet, edges=[[0,0,0,0], [0,0,0,0], [1,1,1,1]], align=through ? [0,0,0] : [0,0,1]);
}

module screw_hole(center=true, extend = 0) {
  total_height = wall_thickness + extend;
  union() {
    cylinder(d=screw_diameter, h=total_height);
    translate([0, 0, total_height - (screw_head_height/2)])
    cylinder(d1=screw_diameter, d2=screw_head_diameter, h=screw_head_height, center=center);
  }
}

if (part == "connector"){
  connector();
} 

if (part == "coupler"){
  coupler(has_hook=coupler_has_hook);
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

if (part == "shelf"){
  shelf();
}
