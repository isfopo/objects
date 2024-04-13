diameter = 325.12; // mmm
radius = diameter/2;
thickness = 8; // mm
insert_thickness = 4; // mm

flange_width = 40; // mm
flange_thickness = 1; // mm

segments = 4;
angle = 360/segments;

inert_length = 2; // deg

$fn = 100;

module snare_ring() {
  module shape(angle, thickness, offset = 0, with_flange = false) {
    rotate_extrude(convexity = 10, angle=angle)
    translate([radius, 0, 0])
    union() {
      union() {
        translate([-thickness/2 + -offset, -thickness/2])
        circle(d = thickness);
        translate([-thickness + - offset, -thickness/2])
        square([thickness, thickness/2]);
      }
      if (with_flange) {
        translate([-thickness - flange_width, -flange_thickness])
        square([flange_width, flange_thickness]);
      }
    }
  }

  difference() {
    union() {
      shape(angle, thickness, with_flange = true);
      shape(angle + inert_length, insert_thickness, offset = (thickness/2) - (insert_thickness/2));
    }
    shape(inert_length, insert_thickness, offset = (thickness/2) - (insert_thickness/2));
  }
}

snare_ring();