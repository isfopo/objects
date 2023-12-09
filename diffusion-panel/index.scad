width = 70;
divisions = 6;
min_height = 2;
max_height = 8;

number_of_blocks = divisions * divisions;

module panel()
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

panel();
