include <hang-holes.scad>

module connector(base = 1, height = 1, radius = .1, depth = 2)
{
	sqrt_of_three = sqrt(3);
	points = [
		[ 0, 0 ],
		[ ((3 * sqrt_of_three) / 4) * base, -(3 / 4) * base ],
		[ ((3 * sqrt_of_three) / 4) * base, (3 / 4) * base ],
	];

	union()
	{
		linear_extrude(height = height) polygon(points = points);
		for (i = [0:2])
		{
			translate(points[i])
			hole(radius, depth);
		}
	}
}
