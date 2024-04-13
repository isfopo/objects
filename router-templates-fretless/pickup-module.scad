thickness = 8;
frame_width = 80;

pickup_width = 45;
inner_width = pickup_width - (2 * sqrt(12.5));

$fn = 50;

module index()
{
	difference()
	{
		cube([ frame_width, frame_width, thickness ], center = true);

		hull()
		{
			cube([ pickup_width, inner_width, thickness ], center = true);
			cube([ inner_width, pickup_width, thickness ], center = true);
		}
	}
}

index();
