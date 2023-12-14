module edison(base = 1)
{
	sqrt_of_three = sqrt(3);

	points = [
		[ 0, 0 ],
		[ 0, sqrt_of_three ],
		[ 1, sqrt_of_three ],
		[ 3 / 2, (3 * sqrt_of_three) / 2 ],
		[ 3, sqrt_of_three ],
		[ 3, 0 ],
		[ 4, 0 ],
		[ 9 / 2, -(sqrt_of_three / 2) ],
		[ 3, -sqrt_of_three ],
		[ 3 / 2, -(sqrt_of_three / 2) ],
		[ 1, -sqrt_of_three ],
		[ -1, -sqrt_of_three ],
		[ -(3 / 2), -(sqrt_of_three / 2) ],
		[ 0, 0 ],
	];

	scale([ base, base ]) polygon(points = points);
}
