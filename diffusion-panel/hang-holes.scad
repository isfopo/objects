include <../libraries/helpers.scad>

hole_radius = 4;
hole_depth = 8;

module add_holes(width, inset)
{
	difference()
	{
		children();
		translate([ inset, inset, 0 ])
		hole(hole_radius, hole_depth);
		translate([ width - inset, inset, 0 ])
		hole(hole_radius, hole_depth);
		translate([ inset, width - inset, 0 ])
		hole(hole_radius, hole_depth);

		translate([ width - inset, width - inset, 0 ])
		hole(hole_radius, hole_depth);
	}
}
