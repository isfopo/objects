use <index.scad>;

module holder()
{
	difference()
	{
		outer();
		inner();
	}
}

module outer()
{
	outer_width = jack_mid_diameter + padding;

	union()
	{
		translate([ (base_width - outer_width) / 2, 0, 0 ])
		cube([ outer_width, jack_length, jack_mid_diameter / 2 ]);
		translate([ (base_width) / 2, 0, (jack_mid_diameter) / 2 ])
		rotate([ -90, 0, 0 ])
		{
			half_cylinder(h = jack_length, d = jack_mid_diameter + padding, rotation = 180, $fn = fn);
		}
	}
}

scale_factor = .05;
module inner()
{

	union()
	{
		linear_extrude(height = jack_mid_diameter / 2) projection(cut = false) jack_hole();

		jack_hole();
	}
}

module jack_hole()
{
	mid = base_width / 2;
	translate([ mid, 0, jack_mid_diameter / 2 ])
	rotate([ -90, 0, 0 ])
	scale([ 1 + scale_factor, 1 + scale_factor, 1 + scale_factor ]) translate([ 0, 0, scale_factor / -2 ])
	union()
	{
		cylinder(d1 = jack_front_diameter, d2 = jack_mid_diameter, h = jack_front_to_mid, $fn = fn);
		translate([ 0, 0, jack_front_to_mid ])
		cylinder(d1 = jack_mid_diameter, d2 = jack_back_diameter, h = jack_mid_to_back, $fn = fn);
	}
}

module half_cylinder(d, h, rotation = 0)
{
	r = d / 2;
	steps = $fn > 0 ? $fn : ceil(max(min(360 / $fa, 2 * PI * r / $fs), 5));
	rotate([ 0, 0, rotation ])
	linear_extrude(h)
	{
		points = [for (i = [0:steps])[cos(i / steps * 180) * r, sin(i / steps * 180) * r]];
		polygon(points);
	}
}
