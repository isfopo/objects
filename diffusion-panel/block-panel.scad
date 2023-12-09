use <../libraries/helpers.scad> // https://github.com/cfinke/OpenSCAD-Dovetails
include <inserts.scad>

width = 70;
divisions = 6;
min_height = 4;
max_height = 16;

number_of_blocks = divisions * divisions;
$fn = 100;

module block_panel()
{
	inserts()
	{
		blocks();
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
