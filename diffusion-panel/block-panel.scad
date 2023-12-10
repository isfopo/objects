use <../libraries/helpers.scad> // https://github.com/cfinke/OpenSCAD-Dovetails

module block_panel(width, divisions = 4, min_height = 4, max_height = 16)
{
	union()
	{
		cube([ width, width, min_height ]);
		blocks(width, divisions, min_height, max_height);
	}
}

module blocks(width, divisions, min_height, max_height)
{
	tolerance = .1;
	number_of_blocks = divisions * divisions;
	heights = rands(min_height, max_height, number_of_blocks);
	division_width = width / divisions;

	for (i = [0:number_of_blocks - 1])
	{
		row = i % divisions;
		col = floor(i / divisions);

		translate([ (row * division_width) - tolerance, (col * division_width) - tolerance, 0 ])
		cube([ division_width + (tolerance / divisions), division_width + (tolerance / divisions), heights[i] ]);
	}
}
