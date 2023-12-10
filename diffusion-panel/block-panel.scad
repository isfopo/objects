use <../libraries/helpers.scad> // https://github.com/cfinke/OpenSCAD-Dovetails

module block_panel(width, divisions = 4, min_height = 4, max_height = 16, max_slant = 0)
{
	union()
	{
		cube([ width, width, min_height ]);
		blocks(width, divisions, min_height, max_height, max_slant);
	}
}

module blocks(width, divisions, min_height, max_height, max_slant = 0)
{
	tolerance = .1;
	number_of_blocks = divisions * divisions;
	heights = rands(min_height, max_height, number_of_blocks);
	division_width = (width / divisions) + (tolerance / divisions);

	for (i = [0:number_of_blocks - 1])
	{
		corner_heights = rands(0, max_slant, 4);
		row = i % divisions;
		col = floor(i / divisions);

		translate([ (row * division_width), (col * division_width), 0 ])
		union()
		{
			translate([ 0, 0, heights[i] ])
			polyhedron(points =
			               [
				               [ 0, 0, 0 ],
				               [ division_width, 0, 0 ],
				               [ division_width, division_width, 0 ],
				               [ 0, division_width, 0 ],
				               [ 0, 0, corner_heights[0] ],
				               [ division_width, 0, corner_heights[1] ],
				               [ division_width, division_width, corner_heights[2] ],
				               [ 0, division_width, corner_heights[3] ],
			               ],
			           faces = [
				           [ 0, 1, 2, 3 ], // bottom
				           [ 4, 5, 1, 0 ], // front
				           [ 7, 6, 5, 4 ], // top
				           [ 5, 6, 2, 1 ], // right
				           [ 6, 7, 3, 2 ], // back
				           [ 7, 4, 0, 3 ], // left
			           ]);

			cube([ division_width, division_width, heights[i] ]);
		}
	}
}
