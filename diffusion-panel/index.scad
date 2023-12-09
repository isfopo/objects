include <block-panel.scad>
include <pyramid-panel.scad>
include <inserts.scad>
include <hang-holes.scad>

width = 180;
hole_inset = width / 4;

$fn = 20;

inserts()
{
	add_holes(width, hole_inset) pyramid_panel();
}
