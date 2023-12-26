use <../libraries/BOSL/threading.scad>

top_diamater = 21;
bottom_diamater = 34;
top_height = 34;
bottom_height = 12;

total_height = top_height + bottom_height;

leg_thread_diameter = 10;
leg_pitch = 1.5875;
leg_screw_depth = 20;

peg_thread_diameter = 8;
peg_pitch = 1.5875;
peg_screw_depth = total_height - leg_screw_depth;

$fn = 10;

module kick_drum_foot()
{
	difference()
	{
		%union()
		{
			cylinder(d1 = top_diamater, d2 = bottom_diamater, h = top_height);
			translate([ 0, 0, top_height ])
			cylinder(d1 = bottom_diamater, d2 = top_diamater, h = bottom_height);
		}

		union()
		{
			// leg threading
			translate([ 0, 0, (leg_screw_depth / 2) ])
			threaded_rod(d = leg_thread_diameter, l = leg_screw_depth, pitch = leg_pitch);

			// peg threading
			translate([ 0, 0, (leg_screw_depth ) + (peg_screw_depth/2) ])
			threaded_rod(d = peg_thread_diameter, l = peg_screw_depth, pitch = peg_pitch);
		}
	}
}

kick_drum_foot();
