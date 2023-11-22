include <./libraries/>
nfc_diameter = 25;

thickness = 5;
padding = 2;
icon = "./icons/toggle.svg";
icon_depth = 2;

$fn = 100;

module top() {
  difference() {
    cylinder(h = 5, d = nfc_diameter + padding);
    translate([0, 0, thickness - icon_depth]) icon();
  }
}

module icon() {
  scale = nfc_diameter / 12;
  scale([scale, scale, 1]) linear_extrude(height = icon_depth) 
    import(icon, center=true);
}

top();