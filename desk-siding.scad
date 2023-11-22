numberOfNails = 0;

width = 140;
height = 45;
depth = 10;
thickness = 2;
holeThickness = 3;

slopeFactor = 1.5;

tabWidth = 10;
tabDepth = 4;

module prism(l, w, h)
{
	polyhedron( // pt 0         1            2            3            4            5
	    points = [ [ 0, 0, 0 ], [ l, 0, 0 ], [ l, w, 0 ], [ 0, w, 0 ], [ 0, w, h ], [ l, w, h ] ],
	    faces = [ [ 0, 1, 2, 3 ], [ 5, 4, 3, 2 ], [ 0, 4, 5, 1 ], [ 0, 3, 4 ], [ 5, 2, 1 ] ]);
}

module nailHole(depth, thickness, position, x, y, z)
{
	translate([ x - (depth / 2), y * position, (z + depth) / 2 ])
	{
		rotate([ 0, 90, 0 ])
		{
			cylinder(d = thickness, h = depth, center = true);
		}
	}
}

module siding(length, height, depth, thickness, holeThickness)
{
	difference()
	{
		union()
		{
			// side
			translate([ thickness * slopeFactor, 0, 0 ])
			{
				mirror([ 1, 0, 1 ]) rotate([ 0, 0, 90 ])
				prism(length, thickness, thickness * slopeFactor);
				cube([ height - (thickness * slopeFactor), length, thickness ]);
			}

			// lip
			translate([ height - thickness, 0, 0 ])
			{
				cube([ thickness, length, depth ]);
				translate([ thickness, 0, depth ])
				rotate([ 0, 0, 90 ])
				prism(length, thickness, thickness * slopeFactor);
			}

			translate([(height - tabWidth) / 2, length, 0]) {
				cube([tabWidth, tabDepth, thickness]);
			}
		}

		translate([(height - tabWidth) / 2, 0, 0]) {
			cube([tabWidth, tabDepth, thickness]);
		}

		spacing = 1 / numberOfNails;

		for (positition = [spacing / 2:spacing:1 - (spacing / 2)])
			nailHole(thickness, holeThickness, positition, height, length, depth);
	}
}

siding(width, height, depth, thickness, holeThickness);
