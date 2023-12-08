use <../libraries/helpers.scad>

width = 40;
mount_screw_diameter = 4;
mount_screw_spacing = 28;
mount_height = 15;
mount_thickness = 3;

usb_width = 17;
usb_height = 16;

base_screw_diameter = 4;
base_screw_head_diameter = 7;
base_depth = 18;
base_thickness = 3;

$fn = 100;

module usb_bracket()
{
	union()
	{
		mount();
		base();
	}
}

module base()
{
	difference()
	{
		cube([ width, base_depth, base_thickness ]);
		base_screws();
	}
}

module mount()
{
	difference()
	{
		brackets();
		mount_screws();
	}
}

module brackets()
{
	side_width = (width - usb_width) / 2;
	height = mount_thickness + usb_height / 2;
	raduis = mount_height / 2;
	bracket();

	translate([ width, 0, 0 ])
	mirror([ 1, 0, 0 ]) bracket();

	// translate([ side_width, 0, height ])
	// rotate([ 90, 0, 180 ])
	// quartercylinder(r = mount_height, h = mount_thickness);
}

module bracket()
{
	side_width = (width - usb_width) / 2;
	height = mount_thickness + usb_height / 2;
	raduis = mount_height / 2;

	union()
	{
		cube([ side_width, mount_thickness, height ]);
		translate([ raduis, 0, height ])
		cube([ side_width - raduis, mount_thickness, raduis ]);
		translate([ raduis, 0, height ])
		rotate([ -90, 0, 0 ])
		quartercylinder(r = raduis, h = mount_thickness);
	}
}

module mount_screws()
{
	translate([ (width - mount_screw_spacing) / 2, 0, 0 ])
	mount_screw();
	translate([ ((width - mount_screw_spacing) / 2) + mount_screw_spacing, 0, 0 ])
	mount_screw();
}

module mount_screw()
{
	translate([ 0, 0, usb_height / 2 + mount_thickness ])
	rotate([ -90, 0, 0 ])
	cylinder(d = mount_screw_diameter, h = mount_thickness);
}

module base_screws()
{
	translate([ (width - mount_screw_spacing) / 2, 0, 0 ])
	base_screw();
	translate([ ((width - mount_screw_spacing) / 2) + mount_screw_spacing, 0, 0 ])
	base_screw();
}

module base_screw()
{
	translate([ 0, (base_depth / 2) + mount_thickness, 0 ])
	cylinder(d1 = base_screw_diameter, d2 = base_screw_head_diameter, h = base_thickness);
}

usb_bracket();
