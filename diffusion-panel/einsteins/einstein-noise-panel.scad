include <../../libraries/shapes.scad>

module einstein_noise_panel(base = 1, height = 1, flip = false)
{
	intersection()
	{
		linear_extrude(height = 100) edison(base);
		scale([ 1, 1, 3 ]) surface(file = "../gen/perlin.dat", convexity = 10, center = true);
	}
}
