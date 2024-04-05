thickness = 8;
inner_diameter = 150;
frame_width = 190;

$fn = 50;

module index()
{
	difference()
	{
		cube([ frame_width, frame_width, thickness ], center = true);
		cylinder(d = inner_diameter, h = thickness, center = true);
	}
}

index();
