include <index.scad>
use <../libraries/threads-scad/threads.scad>

module bottom()
{
	difference()
	{
		cap();
		translate([ 0, 0, -padding ])
		cylinder(d = nfc_diameter, h = padding);
		ScrewThread(nfc_diameter, screw_depth + nfc_thinkness, pitch = screw_pitch, tooth_angle = thread_angle);
	}
}

module cap()
{
	union()
	{
		cylinder(h = thickness, d = nfc_diameter + padding);
		translate([ 0, 0, thickness ])
		cylinder(h = padding / 2, d = nfc_diameter);
		translate([ 0, 0, thickness ])
		rotate_extrude(convexity = 10) translate([ nfc_diameter / 2, 0, 0 ])
		circle(d = padding);
		translate([ 0, 0, 0 ])
		rotate_extrude(convexity = 10) translate([ nfc_diameter / 2, 0, 0 ])
		circle(d = padding);
	}
}
