use <block-panel.scad>
use <pyramid-panel.scad>
use <multi-pyramid-panel.scad>
use <absorption-panel.scad>
use <wave-panel.scad>
use <inserts.scad>
use <hang-holes.scad>

width = 190;
hole_inset = width / 4;

join_length = 50;
join_depth = 6;
dovetail_wings = 2;

make_lock = false;

$fn = 10;

interlocking_inserts(radius = 1, depth = 4, bridge_depth = 1, inset = 3, per_side = 2, width = width,
                     make_lock = make_lock)
{
	add_holes(width, radius = 2, depth = 4, inset = hole_inset)
	{
		// absorption_panel(width, 10);
		// block_panel(width = width, min_height = 10, max_height = 15, max_slant = 30);
		//  pyramid_panel(width = width, padding = 6, base_height = 10, apex_height = 20, min_deviation = 20,
		//                max_deviation = 30);
		// wave_panel(width = width, min_height = 4, max_height = 16);
	}
}
