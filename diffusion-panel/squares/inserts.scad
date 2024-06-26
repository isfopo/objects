include <../libraries/helpers.scad>

module dovetail_inserts(join_length, join_depth, dovetail_wings, end = [ false, false ])
{
	difference()
	{
		union()
		{
			children();
			if (!end[0])
			{
				join_insert("x", out = true);
			}
			if (!end[1])
			{
				join_insert("y", out = true);
			}
		}
		join_insert("x");
		join_insert("y");
	}
}

module join_insert(direction = "x", out = false)
{
	offset = (width - join_length) / 2;
	if (direction == "x")
	{
		translate([ offset, out ? width : 0, 0 ])
		linear_extrude(height = 10) polygon([
			[ -0.1, -0.1 ], [ -dovetail_wings, join_depth ], [ join_length + dovetail_wings, join_depth ],
			[ join_length, -0.1 ]
		]);
	}
	else
	{
		translate([ out ? width : 0, offset + join_length, 0 ])
		rotate([ 0, 0, -90 ])
		linear_extrude(height = 10) polygon([
			[ -0.1, -0.1 ], [ -dovetail_wings, join_depth ], [ join_length + dovetail_wings, join_depth ],
			[ join_length, -0.1 ]
		]);
	}
}

module interlocking_inserts(radius, depth, bridge_depth, inset, per_side, width, make_lock = false)
{
	if (make_lock)
	{
		for (i = [0:per_side * 4])
		{
			translate([ 0, i * radius * 4, 0 ])
			lock(radius, depth, bridge_depth, inset);
		}
	}
	else
	{
		difference()
		{
			children();
			for (i = [1:per_side])
			{
				union()
				{
					translate([ 0, (width / (per_side + 1)) * i, 0 ])
					gap(radius, depth, bridge_depth, inset);

					mirror([ 1, -1, 0 ]) translate([ 0, (width / (per_side + 1)) * i, 0 ])
					gap(radius, depth, bridge_depth, inset);

					translate([ width, 0, 0 ])
					rotate([ 0, 0, 180 ])
					mirror([ 0, -1, 0 ]) translate([ 0, (width / (per_side + 1)) * i, 0 ])
					gap(radius, depth, bridge_depth, inset);

					translate([ 0, width, 0 ])
					rotate([ 0, 0, -90 ])
					mirror([ 0, 0, 0 ]) translate([ 0, (width / (per_side + 1)) * i, 0 ])
					gap(radius, depth, bridge_depth, inset);
				}
			}
		}
	}
}

module gap(radius, depth, bridge_depth, inset)
{
	union()
	{
		translate([ inset, 0, 0 ])
		hole(radius, depth);
		translate([ 0, 0, bridge_depth / 2 ])
		rotate([ 0, 90, 0 ])
		linear_extrude(height = inset) union()
		{
			square([ bridge_depth, radius * 2 ], center = true);
			translate([ -(bridge_depth / 2), 0, 0 ])
			circle(r = radius);
		}
	}
}

module lock(radius, depth, bridge_depth, inset)
{
	union()
	{
		gap(radius, depth, bridge_depth, inset);
		mirror([ 1, 0, 0 ]) gap(radius, depth, bridge_depth, inset);
	}
}
