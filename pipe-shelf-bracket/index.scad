use <../libraries/BOSL/shapes.scad>
use <../libraries/BOSL/constants.scad>

pipe_diameter = 20;
thickness = 6;
width = pipe_diameter + thickness + thickness;
height = 30;

bracket_depth = 50;
bracket_thickness = 10;

bracket_screw_diameter = 3;
bracket_screw_head_diameter = 5;

$fn = 20;

module pipe_shelf_bracket()
{
	module base()
	{
		translate([ bracket_depth / 2, 0, bracket_thickness / 2 ])
		cuboid([ bracket_depth, width, bracket_thickness ], chamfer = 4,
		       edges = [ [ 0, 0, 0, 0 ], [ 0, 0, 0, 0 ], [ 1, 0, 0, 1 ] ]);
	}

	difference()
	{
		union()
		{
			cylinder(h = height, d = width);
			base();
		}

		cylinder(h = height, d = pipe_diameter);
	}
}

pipe_shelf_bracket();
