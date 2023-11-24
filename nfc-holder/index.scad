use <bottom.scad>;
use <top.scad>;
nfc_diameter = 26;
nfc_thinkness = 1;

thickness = 3;
padding = 3;
icon = "./icons/toggle.svg";
icon_depth = 2;

screw_depth = 2;
screw_pitch = 1;
thread_angle = 45;

spacing = 36;

$fn = 100;

translate([ spacing / 2, 0, screw_depth ]) top();
rotate([ 180, 0, 0 ]) translate([ spacing / -2, 0, -(thickness + padding / 2) ]) bottom();