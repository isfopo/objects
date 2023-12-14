module wave_panel(width, min_height = 4, max_height = 5, precision = 2)
{
	union()
	{
		cube([ width, width, min_height ]);
		translate([ 0, 0, 0 ])
		waves_2d(width, max_height - min_height, (width * precision) / 19.95, (width * precision) / 19.95 / 2,
		         precision);
	}
}

module waves_1d(width, height, cols, freq, precision)
{
	col_width = width / cols;

	for (i = [0:(width - 1) / precision])
	{
		for (j = [0:cols - 1])
		{
			translate([ i * precision, j * col_width, 0 ])
			if (j % 2 == 0)
			{
				cube([ precision, col_width, sin(i * freq) * height + height ]);
			}
			else
			{
				cube([ precision, col_width, -sin(i * freq) * height + height ]);
			}
		}
	}
}

module waves_2d(width, height, x_freq, y_freq, precision)
{
	scale([ width / 10, width / 10, 1 ]) surface(file = "gen/off10.dat", convexity = 10, invert = true);
}
