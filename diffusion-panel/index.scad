height = 70;
divisions = 8;
min_height = 2;
max_height = 8;

blocks = divisions * divisions;

module pannel()
{
	heights = rands(min_height, max_height, blocks);

	for (i = [0:blocks])
	{
		translate([ i, 0, 0 ])
		cube([ 1, 1, heights[i] ]);
	}
}

pannel();
