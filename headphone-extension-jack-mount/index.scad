include <base.scad>;
include <holder.scad>;

jack_front_diameter = 14;
jack_mid_diameter = 16;
jack_back_diameter = 7;

jack_front_to_mid = 53;
jack_mid_to_back = 15;

jack_length = jack_front_to_mid + jack_mid_to_back;

padding = 10;

base_width = 60;
base_length = 60;
base_thickness = 5;

holder_thickness = 4;

screw_diameter = 4;
screw_head_diameter = 5;
screw_head_height = 3;
screw_offest = 4;

corner_radius = 3;

fn = 100;

difference()
{
	union()
	{
		base();
		outer();
	}
	inner();
}
