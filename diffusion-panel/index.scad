height = 70;
divisions = 8;
min_height = 2;
max_height = 8;

number_of_blocks = divisions * divisions;

module pannel()
{
	heights = rands(min_height, max_height, number_of_blocks);

	for (i = [0:number_of_blocks - 1])
	{
		row = i % divisions;
		division_height = height / divisions;
		translate([ i, row * divisions, 0 ])
		cube([ division_height, division_height, heights[i] ]);
	}
}

pannel();
