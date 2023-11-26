use <../libraries/BOSL/threading.scad>

top_diamater = 21;
bottom_diamater = 34;
top_height = 34;
bottom_height = 8;
thread_diameter = 11;

$fn = 10;

module kick_drum_foot()
{
	difference()
	{
		union()
		{
			cylinder(d1 = top_diamater, d2 = bottom_diamater, h = top_height);
			translate([ 0, 0, top_height ])
			cylinder(d1 = bottom_diamater, d2 = top_diamater, h = bottom_height);
		}
		translate([ 0, 0, top_height / 2 ])
		threaded_rod(d = thread_diameter, l = top_height, pitch = 1.5875);
	}
}

kick_drum_foot();
