include <inserts.scad>

module pyramid_panel(width, padding, base_height, apex_height, min_deviation, max_deviation)
{
	union()
	{
		translate([ padding, padding, base_height ])
		pyramid(width, padding, base_height, apex_height, min_deviation, max_deviation);
		base(width, base_height);
	}
}

module base(width, base_height)
{
	cube([ width, width, base_height ]);
}

module pyramid(width, padding, base_height, apex_height, min_deviation, max_deviation)
{
	diviation_range = max_deviation - min_deviation;
	offests = rands(-diviation_range, diviation_range, 2);
	x_offest = offests[0] > 0 ? offests[0] + min_deviation : offests[0] - min_deviation;
	y_offest = offests[1] > 0 ? offests[1] + min_deviation : offests[1] - min_deviation;
	pyramid_width = width - (padding * 2);

	polyhedron(points =
	               [
		               [ 0, 0, 0 ],
		               [ pyramid_width, 0, 0 ],
		               [ pyramid_width, pyramid_width, 0 ],
		               [ 0, pyramid_width, 0 ],
		               [ pyramid_width / 2 + x_offest, pyramid_width / 2 + y_offest, apex_height ],
	               ],
	           faces = [
		           [ 0, 1, 2, 3 ],
		           [ 4, 1, 0 ],
		           [ 4, 2, 1 ],
		           [ 4, 3, 2 ],
		           [ 4, 0, 3 ],
	           ]);
}
