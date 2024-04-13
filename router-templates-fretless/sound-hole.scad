thickness = 8;
inner_diameter = 150;
frame_width = 190;

center_hole_diameter = 70;

router_width = 30;
angle = 150;

$fn = 50;

module index()
{
	difference()
	{
		cube([ frame_width, frame_width, thickness ], center = true);

		rotate_extrude(angle = angle) translate([ (inner_diameter / 2) - (thickness / 2), 0, 0 ])
		square(size = [ router_width, thickness ], center = true);

		rotate([ 0, 0, 180 ])
		rotate_extrude(angle = angle) translate([ (inner_diameter / 2) - (thickness / 2), 0, 0 ])
		square(size = [ router_width, thickness ], center = true);

		cylinder(d = center_hole_diameter, h = thickness, center = true);
	}
}

index();
