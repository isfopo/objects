module edison(base = 1)
{
	points = [
		[ 0, 0 ],
		[ 0, sqrt(3) ],
		[ 1, sqrt(3) ],
		[ 3 / 2, (3 * sqrt(3)) / 2 ],
		[ 3, sqrt(3) ],
		[ 3, 0 ],
		[ 4, 0 ],
		[ 9 / 2, -(sqrt(3) / 2) ],
		[ 3, -sqrt(3) ],
		[ 3 / 2, -(sqrt(3) / 2) ],
		[ 1, -sqrt(3) ],
		[ -1, -sqrt(3) ],
		[ -(3 / 2), -(sqrt(3) / 2) ],
		[ 0, 0 ],
	];

	scale([ base, base ]) polygon(points = points);
}
