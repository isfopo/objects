include <block-panel.scad>
include <pyramid-panel.scad>
include <multi-pyramid-panel.scad>
include <inserts.scad>
include <hang-holes.scad>

width = 120;
hole_inset = width / 4;

join_length = 50;
join_depth = 6;
dovetail_wings = 2;

$fn = 10;

interlocking_inserts(1, 4, 1, 3, 3, width)
{
	add_holes(width, hole_inset)
	{
		block_panel(width = width, min_height = 10, max_height = 20);
	}
}
