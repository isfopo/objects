include <einstein-point-panel.scad>
include <einstein-edge-panel.scad>
include <hang-holes.scad>
include <connector.scad>

base = 20;
height = 10;
lift = 10;
flip = false;

hole_radius = 2;
hole_depth = 5;

connector_height = 5;

make_connector = true;

$fn = 24;

if (make_connector)
{
	connector(base = base, height = connector_height, depth = connector_height + hole_depth, radius = hole_radius);
}
else
{
	add_holes(base = base, radius = hole_radius, depth = hole_depth)
	{
		einstein_point_panel(base = base, height = height, lift = lift, twist = 0, flip = flip);
	}
}
