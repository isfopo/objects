inner_diameter = 12;
outer_diameter = 24;
mid_diameter = inner_diameter / 2 + (outer_diameter / 2 - inner_diameter / 2) / 2;

height = 8;

knotch_width = 2;

use_strait_hole = false;
use_loop = true;

through_hole_diameter = 3;
through_hole_inset = -1.5;
loop_diameter = 11;

$fn = 100;

difference()
{

	linear_extrude(height = height)
	{
		union()
		{
			difference()
			{
				circle(d = outer_diameter);
				union()
				{
					circle(d = inner_diameter);
					translate([ 0, knotch_width / -2, 0 ])
					mirror([ 1, 0, 0 ]) square([ outer_diameter / 2, knotch_width ]);
					mirror([ 1, 0, 0 ]) translate([ mid_diameter - knotch_width / 2, knotch_width / 2, 0 ])
					square([ (outer_diameter - inner_diameter) / 2, outer_diameter / 2 ]);
				}
			}
			translate([ -((mid_diameter - knotch_width / 2) + knotch_width), 4, 0 ])
			right_triangle(knotch_width * .8, knotch_width);
			rotate([ 180, 180, 0 ])
			translate([ ((mid_diameter - knotch_width / 2)), -6, 0 ])
			right_triangle(knotch_width * .8, knotch_width);
			mirror([ 1, 0, 0 ])
			    circle_section(outer_diameter, -((mid_diameter - knotch_width / 2) + knotch_width), knotch_width / 2);
		}
	}
	mirror([ 1, 0, 0 ]) through_hole();
}

module circle_section(diameter, x_offset, y_offset)
{
	difference()
	{
		circle(d = diameter);
		mirror([ 1, 1, 0 ]) translate([ y_offset, diameter / -2 ])
		square([ diameter, diameter ]);
		mirror([ 1, 1, 0 ]) translate([ diameter / -2, x_offset ])
		square([ diameter, diameter ]);
	}
}

module right_triangle(a, b)
{
	polygon([ [ 0, 0 ], [ a, 0 ], [ 0, b ] ]);
}

module through_hole()
{
	if (use_strait_hole)
	{
		translate([ (outer_diameter / -2) + through_hole_inset, 0, height * .5 ])
		rotate([ 90, 0, 0 ])
		cylinder(h = outer_diameter, d = screw_diameter, center = true);
	}
	if (use_loop)
	{
		translate([ ((outer_diameter / -2) + through_hole_inset) - (loop_diameter / 2), 0, height * .5 ])
		rotate_extrude(angle = 360)
		{
			translate([ loop_diameter - through_hole_diameter / 2, 0 ])
			circle(d = through_hole_diameter);
		}
	}
}
