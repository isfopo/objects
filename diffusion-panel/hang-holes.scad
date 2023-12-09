hole_radius = 4;
hole_depth = 8;

module hole()
{
	union()
	{
		translate([ 0, 0, hole_depth - hole_radius / 2 ])
		sphere(r = hole_radius);
		cylinder(h = hole_depth - hole_radius / 2, r = hole_radius);
	}
}

module add_holes(width, inset)
{
	difference()
	{
		children();
		translate([ inset, inset, 0 ])
		hole();
		translate([ width - inset, inset, 0 ])
		hole();
		translate([ inset, width - inset, 0 ])
		hole();

		translate([ width - inset, width - inset, 0 ])
		hole();
	}
}
