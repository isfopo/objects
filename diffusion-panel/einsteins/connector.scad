include <hang-holes.scad>

module connector(base = 1, height = 1, radius = .1, depth = 2, tolerence = .1)
{
	sqrt_of_three = sqrt(3);
	points = [
		[ 0, 0 ],
		[ ((3 * sqrt_of_three) / 4) * base, -(3 / 4) * base ],
		[ ((3 * sqrt_of_three) / 4) * base, (3 / 4) * base ],
	];

	union()
	{
		translate([ (sqrt_of_three / 2) * base, 0 ])
		difference()
		{
			cylinder(r = base, h = height);
			cylinder(r = base / sqrt_of_three, h = height);
		}
		for (i = [0:2])
		{
			translate(points[i])
			hole(radius - tolerence, depth);
		}
	}
}
