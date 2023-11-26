include <index.scad>
use <../libraries/threads-scad/threads.scad>

module top()
{
	union()
	{
		difference()
		{
			cylinder(h = padding, d = nfc_diameter);
			translate([ 0, 0, thickness - icon_depth ])
			icon();
		}
		translate([ 0, 0, -screw_depth ])
		ScrewThread(nfc_diameter, screw_depth + nfc_thinkness, pitch = screw_pitch, tooth_angle = thread_angle);
	}
}

module icon()
{
	scale = nfc_diameter / 12;
	scale([ scale, scale, 1 ]) linear_extrude(height = icon_depth) import(icon, center = true);
}
