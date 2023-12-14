include <../libraries/helpers.scad>

module add_holes(width, radius, depth, inset)
{
	difference()
	{
		children();
		translate([ inset, inset, 0 ])
		hole(radius, depth);
		translate([ width - inset, inset, 0 ])
		hole(radius, depth);
		translate([ inset, width - inset, 0 ])
		hole(radius, depth);

		translate([ width - inset, width - inset, 0 ])
		hole(radius, depth);
	}
}
