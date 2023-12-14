include <../../libraries/shapes.scad>

module einstein_edge_panel(base = 1, height = 1, twist = 0, flip = false)
{
	linear_extrude(height = height, scale = [ 0, sqrt(3) / 3 ], slices = 100, twist = twist) edison(base);
}
