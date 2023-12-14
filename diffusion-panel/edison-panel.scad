include <../libraries/shapes.scad>

module edison_panel(base = 1, height = 1, twist = 0)
{
	linear_extrude(height = height, scale = [ 0, 0 ], slices = 100, twist = twist) translate([ -sqrt(3) * base, 0, 0 ])
	edison(base);
}
