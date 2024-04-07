use <../libraries/BOSL/shapes.scad>

pipe_diameter = 22; // mm
thickness = 5;      // mm
width = pipe_diameter + thickness + thickness;
height = 60; // mm

bracket_depth = 70;     // mm
bracket_thickness = 10; // mm
bracket_width = 80;

bracket_screw_diameter = 5;       // mm
bracket_screw_head_diameter = 10; // mm
bracket_screw_head_thickness = 5; // mm
bracket_screw_spacing = 50;

clamp_depth = 16;                        // mm
clamp_gap = 10;                          // mm
clamp_width = thickness * 2 + clamp_gap; // mm
clamp_screw_amount = 2;                  // count
clamp_screw_diameter = 5;                // mm
clamp_screw_expand = 30;                 // mm

$fn = 50;

module pipe_shelf_bracket()
{
	module base()
	{
		difference()
		{
			translate([ bracket_depth / 2, 0, bracket_thickness / 2 ])
			hull()
			{
				translate([ -(clamp_depth) - (pipe_diameter / 2), 0, 0 ])
				cylinder(h = bracket_thickness, d = width, center = true);
				cuboid([ bracket_depth, bracket_width, bracket_thickness ], chamfer = 4,
				       edges = [ [ 0, 0, 0, 0 ], [ 0, 0, 0, 0 ], [ 1, 0, 0, 1 ] ]);
			}
			translate([ 0, bracket_screw_spacing / 2, 0 ])
			mount_screw_hole(bracket_screw_diameter, bracket_screw_head_diameter, bracket_screw_head_thickness,
			                 bracket_thickness, location = [ bracket_depth - (width / 2), 0 ], flip = true);

			translate([ 0, bracket_screw_spacing / -2, 0 ])
			mount_screw_hole(bracket_screw_diameter, bracket_screw_head_diameter, bracket_screw_head_thickness,
			                 bracket_thickness, location = [ bracket_depth - (width / 2), 0 ], flip = true);
		}
	}

	module clamp()
	{
		difference()
		{
			union()
			{
				translate([ -(clamp_depth + pipe_diameter) / 2, 0, height / 2 ])
				cuboid([ clamp_depth, clamp_width, height ], chamfer = 2,
				       edges = [ [ 0, 0, 0, 0 ], [ 0, 0, 0, 0 ], [ 0, 1, 1, 0 ] ]);
				children();
			}
			translate([ -(clamp_depth + pipe_diameter) / 2, 0, height / 2 ])
			cuboid([ clamp_depth + pipe_diameter, clamp_gap, height ]);

			for (i = [1:clamp_screw_amount])
			{
				division = (height + clamp_screw_expand) / (clamp_screw_amount + 1);
				level = i * division;
				translate([
					-((clamp_depth + pipe_diameter / 2) - clamp_depth / 2), clamp_width / 2,
					level - (clamp_screw_expand / 2)
				])
				rotate([ 90, 0, 0 ])
				cylinder(h = clamp_width, d = clamp_screw_diameter);
			}
		}
	}

	difference()
	{
		union()
		{
			clamp()
			{
				cylinder(h = height, d = width);
			}
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
