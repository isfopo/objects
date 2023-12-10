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

$fn = 10;

interlocking_inserts(radius = 1, depth = 4, bridge_depth = 1, inset = 3, per_side = 2, width = width, make_lock = false)
{
	add_holes(width, hole_inset)
	{
		block_panel(width = width, min_height = 10, max_height = 20, max_slant = 10);
		// pyramid_panel(width = width, padding = 6, base_height = 10, apex_height = 20, min_deviation = 20,
		//               max_deviation = 30);
	}
}
