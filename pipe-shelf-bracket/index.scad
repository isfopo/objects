pipe_diameter = 20;
thickness = 6;
width = pipe_diameter + thickness + thickness;
height = 30;
bracket_depth = 50;

module pipe_shelf_bracket()
{
	module base()
	{
		union()
		{
			translate([ -width / 2, 0, 0 ])
			cube([ width, bracket_depth, thickness ]);

			translate([ 0, bracket_depth, 0 ])
			cylinder(h = thickness, d = width);
		}
	}

	difference()
	{
		union()
		{
			cylinder(h = height, d = width);
			base();
		}

		cylinder(h = height, d = pipe_diameter);
	}
}

pipe_shelf_bracket();
