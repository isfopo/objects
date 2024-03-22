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
bracket_screw_head_thickness = 5;

$fn = 20;

module pipe_shelf_bracket()
{
	module base()
	{
		difference()
		{
			translate([ bracket_depth / 2, 0, bracket_thickness / 2 ])
			cuboid([ bracket_depth, width, bracket_thickness ], chamfer = 4,
			       edges = [ [ 0, 0, 0, 0 ], [ 0, 0, 0, 0 ], [ 1, 0, 0, 1 ] ]);
			mount_screw_hole(bracket_screw_diameter, bracket_screw_head_diameter, bracket_screw_head_thickness,
			                 bracket_thickness, location = [ bracket_depth - (width / 2), 0 ], flip = true);
		}
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

module mount_screw_hole(screw_diameter, screw_head_diameter, screw_head_height, thickness, location = [ 0, 0 ],
                        flip = false)
{
	rotate([ flip ? 180 : 0, 0, 0 ])
	translate([ 0, 0, (flip ? -thickness : 0) ])
	{
		scale([ 1, 1, 1 ])
		{
			translate([ location[0], location[1], 0 ])
			union()
			{
				translate([ 0, 0, thickness - screw_head_height ])
				cylinder(d1 = screw_diameter, d2 = screw_head_diameter, h = screw_head_height);
				cylinder(h = thickness, d = screw_diameter);
			}
		}
	}
}

pipe_shelf_bracket();
