join_length = 50;
join_depth = 4;

dovetail_wings = 2;

module inserts()
{
	difference()
	{
		union()
		{
			children();
			join_insert("x", out = true);
			join_insert("y", out = true);
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
