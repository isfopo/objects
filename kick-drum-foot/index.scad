use <../libraries/BOSL/threading.scad>

top_diamater = 13;
bottom_diamater = 21;
top_height = 34;
bottom_height = 8;
thread_diameter = 9;

$fn = 100;

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
		trapezoidal_threaded_rod(d = thread_diameter, l = top_height, pitch = 2.54);
	}
}

kick_drum_foot();
