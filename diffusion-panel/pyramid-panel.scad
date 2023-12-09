include <inserts.scad>

width = 190;
base_height = 10;

module pyramid_panel()
{
	inserts()
	{
		base();
	}
}

module base()
{
	cube([ width, width, base_height ]);
}
