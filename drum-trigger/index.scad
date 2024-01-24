diameter = 152.4;    // mm
wall_thickness = 10; // mm
inner_diameter = diameter - wall_thickness;
height = diameter * 2 / 3; // mm

rim_edge_thickness = 2; // mm

lugs = 4;

lug_screw_spacing = 16; // mm
lug_screw_diemater = 6; // mm

piezo_diameter = 30; // mm

$fn = 20;

module drum_trigger()
{
	difference()
	{
		shell();

		lugs();
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

drum_trigger();
