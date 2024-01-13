use <../libraries/BOSL/shapes.scad>;

low_poly = true;

height = 50; // mm
base_height = 4; // mm
leg_length = 100; // mm

leg_diameter = 39; // mm
outer_diameter = 50; // mm
wall_thickness = (outer_diameter-leg_diameter)/2;

foot_height = height;

spacing = 150; // mm

outward_angle = 8; // deg
side_angle = 8; // deg

screw_diameter = 4; // mm
screw_head_diameter = 8; // mm
screw_head_height = 2; // mm
screw_inset = low_poly ? 1.9 : 0; // mm

leg_type = "dowel"; // "dowel" | "baluster"
leg_fillet=5; //mm

part = "bracket"; // "bracket" | "foot"

$fn = 5;

screw_fn = 20;

module bracket() {
  module leg() {
      translate([ spacing/2, 0, 0])
      rotate([side_angle, outward_angle, 0])
      difference() {

      linear_extrude(height=height) {
        difference() {
          offset(r = wall_thickness) {
            square(leg_diameter, center = true);
          }
          offset() {
            square(leg_diameter, center = true);
          }
        }
      }
        translate([(leg_diameter/2), 0, (height+base_height)/2])
        rotate([0, 90, 0])
        screw_hole();
      }
  }

  module base() {
    module side() {
      translate([ spacing/2, 0, 0])
      rotate([side_angle, outward_angle, 0])
      linear_extrude(height=base_height) {
        offset(r = wall_thickness) {
          square(leg_diameter, center = true);
        }
      }
    }

    module base_screw_hole() {
      extend = 15;
      translate([spacing/2, 0, base_height-(wall_thickness + extend)])
      rotate([side_angle, outward_angle, 0])
      screw_hole(extend=extend);
    }

    difference() {
      hull() {
        side();
        mirror([1, 0, 0]) {
          side();
        }
        translate([0, 0, -(((leg_diameter/2+wall_thickness)) * sin(outward_angle) + (leg_diameter/2+wall_thickness) * sin(side_angle)) ])
        cuboid([spacing + leg_diameter + wall_thickness, leg_diameter + wall_thickness*2, base_height], fillet=wall_thickness, edges=[[0,0,0,0], [0,0,0,0], [1,1,1,1]]);
      }
      base_screw_hole();
      mirror([1,0,0])
      base_screw_hole();
    }
  }

  union() {

    base();
    leg();

    mirror([1,0,0])
    leg();
  }
}

module foot() {
  difference() {
    union() {
      linear_extrude(height=height) {
        difference() {
          offset(r = wall_thickness) {
            square(leg_diameter, center = true);
          }
          offset() {
            square(leg_diameter, center = true);
          }
        }
      }
      mirror([0,0,1])
      linear_extrude(height=base_height) {
        offset(r = wall_thickness) {
          square(leg_diameter, center = true);
        }
      }
    }

    translate([(leg_diameter/2), 0, foot_height/2])
    rotate([0, 90, 0])
    screw_hole();
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

module screw_hole(center=true, extend = 0, screw_inset = 0) {
  total_height = wall_thickness + extend - screw_inset;
  union() {
    cylinder(d=screw_diameter, h=total_height, $fn=screw_fn);
    translate([0, 0, total_height - (screw_head_height/2)])
    cylinder(d1=screw_diameter, d2=screw_head_diameter, h=screw_head_height, center=center, $fn=screw_fn);
  }
}

module index(part = part) {
  if (part == "bracket"){
    bracket();
  } 

  if (part == "foot"){
    foot();
  }
}

index();