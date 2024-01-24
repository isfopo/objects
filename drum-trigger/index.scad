diameter = 152.4;    // mm
wall_thickness = 10; // mm
inner_diameter = diameter - wall_thickness;
height = diameter * 2 / 3; // mm

rim_edge_thickness = 2; // mm

lugs = 4;

lug_screw_spacing = 16; // mm
lug_screw_diemater = 6; // mm

piezo_diameter = 30;          // mm
piezo_base_height = 10;       // mm
piezo_base_mount_height = 70; // mm
piezo_base_raise = 0;         // mm
piezo_padding_thickness = 20; // mm
piezo_offset = 10;            // mm

$fn = 20;

module drum_trigger()
{
	union()
	{
		difference()
		{
			shell();

			lugs();
		}

		piezo_base();
	}
}

module shell()
{
	difference()
	{
		cylinder(d = diameter, h = height);
		cylinder(d = inner_diameter, h = height);
		cylinder(d2 = diameter - rim_edge_thickness, d1 = 0, h = height);
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
			cube([ piezo_diameter, 1, piezo_base_mount_height ]);
		}
		cylinder(d = diameter, h = height);
	}
}

drum_trigger();
