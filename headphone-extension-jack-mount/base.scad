use <index.scad>;

module base()
{
	difference()
	{
		base_body();
		screw_hole([ screw_offest, screw_offest ]);
		screw_hole([ base_width - screw_offest, screw_offest ]);
		screw_hole([ screw_offest, base_length - screw_offest ]);
		screw_hole([ base_width - screw_offest, base_length - screw_offest ]);
	}
}

module base_body()
{
	linear_extrude(height = base_thickness)
	{
		translate([ corner_radius, corner_radius, 0 ])
		minkowski()
		{
			square([ base_width - 2 * corner_radius, base_length - 2 * corner_radius ]);
			circle(corner_radius, $fn = 100);
		}
	}
}

module screw_hole(location = [ 0, 0 ])
{
	offset_factor = 0.01;
	translate([ 0, 0, offset_factor / -2 ])
	{

		scale([ 1, 1, 1 + offset_factor ])
		{
			translate([ location[0], location[1], 0 ])
			union()
			{
				translate([ 0, 0, base_thickness - screw_head_height ])
				cylinder(d1 = screw_diameter, d2 = screw_head_diameter, h = screw_head_height, $fn = fn);
				cylinder(h = base_thickness, d = screw_diameter, $fn = fn);
			}
		}
	}
}
