use <../libraries/helpers.scad> // https://github.com/cfinke/OpenSCAD-Dovetails

width = 70;
divisions = 6;
min_height = 4;
max_height = 16;

join_length = 50;
join_radius = 2;

number_of_blocks = divisions * divisions;
$fn = 100;
module panel()
{
	difference()
	{
		union()
		{
			blocks();
			join_insert("x", out = true);
			join_insert("y", out = true);
		}
		join_insert("x");
		join_insert("y");
	}
}

module blocks()
{
	heights = rands(min_height, max_height, number_of_blocks);
	division_width = width / divisions;

	for (i = [0:number_of_blocks - 1])
	{
		row = i % divisions;
		col = floor(i / divisions);

		translate([ row * division_width, col * division_width, 0 ])
		cube([ division_width, division_width, heights[i] ]);
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

panel();
