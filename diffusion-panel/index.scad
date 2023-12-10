include <block-panel.scad>
include <pyramid-panel.scad>
include <inserts.scad>
include <hang-holes.scad>

width = 120;
hole_inset = width / 4;

join_length = 50;
join_depth = 6;
dovetail_wings = 2;

$fn = 20;

inserts(join_length, join_depth, dovetail_wings)
{
	add_holes(width, hole_inset) pyramid_panel();
}
