include <../../libraries/shapes.scad>

module einstein_point_panel(base = 1, height = 1, lift = 0, twist = 0, flip = false)
{
	translate([ 0, 0, lift ])
	linear_extrude(height = height, scale = [ 0, 0 ], slices = 100, twist = twist) edison(base, flip);
	linear_extrude(height = lift) edison(base, flip);
}
