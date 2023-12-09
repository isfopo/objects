join_length = 50;
join_radius = 5;

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
		rotate([ 0, 90, 0 ])
		halfcylinder(r = join_radius, h = join_length);
	}
	else
	{
		translate([ out ? width : 0, offset, 0 ])
		rotate([ -90, 90, 0 ])
		halfcylinder(r = join_radius, h = join_length);
	}
}
