inner_diameter = 11;
outer_diameter = 17;

inner_offset = 1;

height = 10;

knotch_width = 1;

screw_diameter = 2;
screw_head_diameter = 2;
screw_offset = 6;

use_strait_hole = false;
use_loop = true;

through_hole_diameter = 2;
through_hole_inset = -1;
loop_diameter = 8;

$fn = 100;

difference()
{
	cylinder(h = height, d = outer_diameter);
	union()
	{
		translate([ inner_offset, 0, 0 ])
		cylinder(h = height, d = inner_diameter);
		translate([ 0, knotch_width / -2, 0 ])
		mirror([ 1, 0, 0 ]) cube([ outer_diameter / 2, knotch_width, height ]);
		screw_holes();
		through_hole();
	}
}

module screw_hole()
{
	rotate([ 90, 0, 0 ])
	union()
	{
		cylinder(h = outer_diameter, d = screw_diameter, center = true);
		difference()
		{
			cylinder(h = outer_diameter, d = screw_head_diameter, center = true);
			cylinder(h = knotch_width * 4, d = screw_head_diameter, center = true);
		}
	}
}

module screw_holes()
{
	x = -(inner_offset + inner_diameter / 4);
	union()
	{
		translate([ -(screw_offset), 0, height * .25 ])
		screw_hole();
		translate([ -(screw_offset), 0, height * .75 ])
		screw_hole();
	}
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
