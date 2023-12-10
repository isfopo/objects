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

insert_radius = 1;
insert_depth = 4;
insert_bridge_depth = 1;
insert_inset = 3;
inserts_per_side = 3;

make_lock = true;

$fn = 10;

interlocking_inserts(insert_radius, insert_depth, insert_bridge_depth, insert_inset, inserts_per_side, width, make_lock)
{
	add_holes(width, hole_inset)
	{
		block_panel(width = width, min_height = 10, max_height = 20);
	}
}
