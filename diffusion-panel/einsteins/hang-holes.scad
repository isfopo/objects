include <../../libraries/helpers.scad>

module add_holes(base, radius, depth)
{
	sqrt_of_three = sqrt(3);
	difference()
	{
		children();
		translate([ -sqrt_of_three * base, 0, 0 ])
		union()
		{
			translate([ 3 * base, -(sqrt_of_three * base) / 2, 0 ])
			hole(radius, depth);

			translate([ 0, -(sqrt_of_three * base) / 2, 0 ])
			hole(radius, depth);

			translate([ (9 / 4) * base, 3 * (sqrt_of_three * base) / 4, 0 ])
			hole(radius, depth);

			translate([ (3 / 4) * base, (sqrt_of_three * base) / 4, 0 ])
			hole(radius, depth);
		}
	}
}
