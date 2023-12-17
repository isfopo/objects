include <einstein-point-panel.scad>
include <einstein-edge-panel.scad>
include <hang-holes.scad>
include <connector.scad>

base = 20;
height = 20;
lift = 10;
flip = false;
twist = 20;

hole_radius = 2;
hole_depth = 5;

connector_height = 2;

make_connector = false;

$fn = 24;

if (make_connector)
{
	connector(base = base, height = connector_height, depth = connector_height + hole_depth, radius = hole_radius,
	          tolerence = .3);
}
else
{
	add_holes(base = base, radius = hole_radius, depth = hole_depth)
	{
		einstein_point_panel(base = base, height = height, lift = lift, twist = twist, flip = flip);
	}
}
