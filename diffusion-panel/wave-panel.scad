module wave_panel(width, min_height = 4, max_height = 5)
{
	union()
	{
		cube([ width, width, min_height ]);
		translate([ 0, 0, min_height ])
		waves(width, max_height - min_height, 4, 3.5, 1);
	}
}

module waves(width, height, cols, freq, precision)
{
	col_width = width / cols;

	for (i = [0:width - 1])
	{
		for (j = [0:cols - 1])
		{
			translate([ i, j * col_width, 0 ])
			if (j % 2 == 0)
			{

				cube([ 1, col_width, cos(i * freq) * height + height ]);
			}
			else
			{
				cube([ 1, col_width, -cos(i * freq) * height + height ]);
			}
		}
	}
}
