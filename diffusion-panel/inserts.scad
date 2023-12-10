module inserts(join_length, join_depth, dovetail_wings, end = [ false, false ])
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
			[ 0, 0 ], [ -dovetail_wings, join_depth ], [ join_length + dovetail_wings, join_depth ], [ join_length, 0 ]
		]);
	}
	else
	{
		translate([ out ? width : 0, offset + join_length, 0 ])
		rotate([ 0, 0, -90 ])
		linear_extrude(height = 10) polygon([
			[ 0, 0 ], [ -dovetail_wings, join_depth ], [ join_length + dovetail_wings, join_depth ], [ join_length, 0 ]
		]);
	}
}
