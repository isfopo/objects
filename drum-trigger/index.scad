diameter = 152.4;    // mm
wall_thickness = 10; // mm
inner_diameter = diameter - wall_thickness;
height = diameter; // mm

flat_edge_thickness = 2; // mm

lugs = 4;

lug_screw_spacing = 26; // mm
lug_screw_diemater = 6; // mm

piezo_diameter = 30;          // mm
piezo_base_height = 10;       // mm
piezo_base_mount_height = 70; // mm
piezo_base_raise = 0;         // mm
piezo_padding_thickness = 20; // mm
piezo_offset = 10;            // mm

jack_diameter = 7; // mm

// rim
rim_height = 10;                 // mm
rim_thickness = 10;              // mm
rim_lug_hole_diameter = 4;       // mm
rim_lug_hole_inset_diameter = 6; // mm
rim_lug_hole_inset_depth = 6;    // mm

$fn = 20;

part = "drum"; // "drum" | "rim"

// TODO
// - add mount

module drum()
{
	union()
	{
		difference()
		{
			shell();

			lugs();
			jack();
		}

		piezo_base();
	}

	module shell()
	{
		difference()
		{
			cylinder(d = diameter, h = height);
			cylinder(d = inner_diameter, h = height);
			cylinder(d2 = diameter - flat_edge_thickness, d1 = 0, h = height);
		}
	}

	module lugs()
	{
		for (i = [0:360 / lugs:360])
		{
			translate([ 0, 0, height / 2 + lug_screw_spacing ])
			rotate([ 90, 0, i ])
			cylinder(d = lug_screw_diemater, h = diameter / 2);

			translate([ 0, 0, height / 2 - lug_screw_spacing ])
			rotate([ 90, 0, i ])
			cylinder(d = lug_screw_diemater, h = diameter / 2);
		}
	}

	module piezo_base()
	{
		intersection()
		{
			rotate([ 0, 0, 45 ])
			translate([ diameter / 2 - (piezo_diameter / 2 + piezo_offset), 0, 0 ])
			hull()
			{
				translate([ 0, 0, height - (piezo_base_height + piezo_padding_thickness) ])
				cylinder(d = piezo_diameter, h = piezo_base_height);
				translate([ piezo_offset + piezo_diameter / 2, piezo_diameter / 2, piezo_base_raise ])
				rotate([ 0, 0, -90 ])
				translate([ -piezo_diameter / 2, 0, 0 ])
				cube([ piezo_diameter * 2, 1, piezo_base_mount_height ]);
			}
			cylinder(d = diameter, h = height);
		}
	}

	module jack()
	{
		translate([ 0, 0, height / 2 ])
		rotate([ 90, 0, 45 ])
		cylinder(d = jack_diameter, h = diameter / 2);
	}
}

module rim()
{
	difference()
	{
		base();
		lug_holes();
		outer_edge();
	}

	module base()
	{
		linear_extrude(height = rim_height)
		{
			difference()
			{
				offset(r = rim_thickness)
				{
					circle(d = diameter);
				}
				circle(d = diameter);
			}
		}
	}

	module lug_holes()
	{
		for (i = [0:360 / lugs:360])
		{
			rotate([ 0, 0, i ])
			translate([ (diameter + rim_thickness) / 2, 0, 0 ])
			union()
			{
				cylinder(d = rim_lug_hole_diameter, h = rim_height);
				translate([ 0, 0, rim_height - rim_lug_hole_inset_depth ])
				cylinder(d = rim_lug_hole_inset_diameter, h = rim_lug_hole_inset_depth);
			}
		}
	}

	module outer_edge()
	{
		rotate_extrude() translate([ (diameter / 2) + rim_thickness, rim_height, 0 ])
		circle(d = rim_height);
	}
}

if (part == "drum")
{
	drum();
}

if (part == "rim")
{
	rim();
}
