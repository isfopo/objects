module halfcylinder(h, r)
{
	difference()
	{
		cylinder(h = h, r = r);
		translate([ 0, -r, 0 ])
		cube([ r, r * 2, h ]);
	} // df
} // mod

module quartercylinder(h, r)
{
	difference()
	{
		cylinder(h = h, r = r);
		translate([ 0, -r - 0.1, -0.1 ])
		cube([ r + 0.1, r * 2 + 0.2, h + 0.2 ]);
		translate([ -r, 0, 0 ])
		cube([ r * 2 + 0.2, r + 0.1, h + 0.2 ]);
	} // df
} // mod
