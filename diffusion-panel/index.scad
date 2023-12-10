use <block-panel.scad>
use <pyramid-panel.scad>
use <multi-pyramid-panel.scad>
use <inserts.scad>
use <hang-holes.scad>

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

make_lock = false;

$fn = 10;

interlocking_inserts(insert_radius, insert_depth, insert_bridge_depth, insert_inset, inserts_per_side, width, make_lock)
{
	add_holes(width, hole_inset)
	{
		// block_panel(width = width, min_height = 10, max_height = 20);
		pyramid_panel(width = width, padding = 6, base_height = 10, apex_height = 20, min_deviation = 20,
		              max_deviation = 30);
	}
}
