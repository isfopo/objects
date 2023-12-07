include <../libraries/BOSL/shapes.scad>
include <../libraries/BOSL/constants.scad>

drum_diameter = 558.8;

base_width = 100;
base_length = 80;

mount_diameter = 20;

$fn = 100;

module kick_drum_mount()
{
	difference()
	{
		cuboid([ base_width, base_length, 50 ], fillet = 5, edges = EDGES_Z_BK + EDGES_Z_FR);
		translate([ 0, 0, drum_diameter / -2 ])
		rotate([ 90, 0, 0 ])
		cylinder(d = drum_diameter, h = base_width, center = true);
		cylinder(d = mount_diameter, h = 100, center = true);
	}
}

kick_drum_mount();
