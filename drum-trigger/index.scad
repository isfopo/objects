diameter = 152.4;    // mm
wall_thickness = 10; // mm
inner_diameter = diameter - wall_thickness;
height = diameter * 1 / 2; // mm

rim_edge_thickness = 2; // mm

lugs = 4;

lug_screw_spacing = 20; // mm
lug_screw_diemater = 6; // mm

piezo_diameter = 30; // mm

module drum_trigger()
{
	difference()
	{
		cylinder(d = diameter, h = height);
		cylinder(d = inner_diameter, h = height);
		cylinder(d2 = diameter - rim_edge_thickness, d1 = 0, h = height);
	}
}

drum_trigger();
