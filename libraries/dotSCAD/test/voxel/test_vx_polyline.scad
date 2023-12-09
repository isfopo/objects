use <voxel/vx_polyline.scad>

module test_vx_polyline() {
    echo("==== test_vx_polyline ====");

    expected = [[5, 10, 5], [4, 9, 5], [3, 8, 5], [2, 7, 6], [1, 6, 6], [0, 5, 6], [-1, 4, 6], [-2, 3, 6], [-3, 2, 6], [-4, 1, 7], [-5, 0, 7], [-6, -1, 7], [-7, -2, 7], [-8, -3, 7], [-9, -4, 7], [-10, -5, 8], [-11, -6, 8], [-12, -7, 8], [-13, -8, 8], [-14, -9, 8], [-15, -10, 8], [-16, -11, 9], [-17, -12, 9], [-18, -13, 9], [-19, -14, 9], [-20, -15, 9], [-21, -16, 9], [-22, -17, 10], [-23, -18, 10], [-24, -19, 10], [-25, -20, 10], [-25, -19, 10], [-25, -18, 10], [-25, -17, 10], [-25, -16, 11], [-25, -15, 11], [-25, -14, 11], [-25, -13, 11], [-25, -12, 11], [-25, -11, 11], [-25, -10, 11], [-25, -9, 12], [-25, -8, 12], [-25, -7, 12], [-25, -6, 12], [-25, -5, 12], [-25, -4, 12], [-25, -3, 12], [-25, -2, 13], [-25, -1, 13], [-25, 0, 13], [-25, 1, 13], [-25, 2, 13], [-25, 3, 13], [-25, 4, 13], [-25, 5, 14], [-25, 6, 14], [-25, 7, 14], [-25, 8, 14], [-25, 9, 14], [-25, 10, 14], [-25, 11, 14], [-25, 12, 15], [-25, 13, 15], [-25, 14, 15], [-25, 15, 15], [-24, 15, 15], [-23, 15, 15], [-22, 16, 15], [-21, 16, 15], [-20, 16, 16], [-19, 16, 16], [-18, 16, 16], [-17, 17, 16], [-16, 17, 16], [-15, 17, 16], [-14, 17, 16], [-13, 17, 16], [-12, 18, 16], [-11, 18, 16], [-10, 18, 17], [-9, 18, 17], [-8, 18, 17], [-7, 19, 17], [-6, 19, 17], [-5, 19, 17], [-4, 19, 17], [-3, 19, 17], [-2, 20, 17], [-1, 20, 17], [0, 20, 18], [1, 20, 18], [2, 20, 18], [3, 21, 18], [4, 21, 18], [5, 21, 18], [6, 21, 18], [7, 21, 18], [8, 22, 18], [9, 22, 18], [10, 22, 19], [11, 22, 19], [12, 22, 19], [13, 23, 19], [14, 23, 19], [15, 23, 19], [16, 23, 19], [17, 23, 19], [18, 24, 19], [19, 24, 19], [20, 24, 20], [21, 24, 20], [22, 24, 20], [23, 25, 20], [24, 25, 20]];
    actual = vx_polyline([[5, 10, 5], [-25, -20, 10], [-25, 15, 15], [25, 25, 20]]);

    assert(expected == actual);
}

test_vx_polyline();