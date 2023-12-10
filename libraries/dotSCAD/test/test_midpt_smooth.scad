use <unittest.scad>
use <shape_taiwan.scad>
use <midpt_smooth.scad>

module test_midpt_smooth() {
    echo("==== test_midpt_smooth ====");

    taiwan = shape_taiwan(50);  

    expected = [[10.63, 22.383], [10.1322, 22.6054], [9.65611, 22.8175], [9.26491, 23.013], [8.97805, 23.1879], [8.77136, 23.3444], [8.59924, 23.4932], [8.41804, 23.652], [8.19789, 23.835], [7.924, 24.0385], [7.59413, 24.2351], [7.21713, 24.3828], [6.81247, 24.4453], [6.40816, 24.4087], [6.03497, 24.2851], [5.71872, 24.1048], [5.47485, 23.9026], [5.3079, 23.7055], [5.21391, 23.5269], [5.18172, 23.3679], [5.19229, 23.2254], [5.2195, 23.1], [5.23557, 22.9985], [5.21927, 22.9287], [5.16157, 22.891], [5.06439, 22.8749], [4.93268, 22.862], [4.76432, 22.8332], [4.54436, 22.7749], [4.24956, 22.6813], [3.86392, 22.5547], [3.39557, 22.4027], [2.88008, 22.2349], [2.36299, 22.0574], [1.87426, 21.8686], [1.41628, 21.658], [0.974894, 21.4098], [0.541119, 21.1111], [0.123546, 20.7617], [-0.256239, 20.3801], [-0.57757, 19.9999], [-0.831844, 19.6571], [-1.02464, 19.3735], [-1.17023, 19.1499], [-1.28387, 18.9706], [-1.37709, 18.815], [-1.45723, 18.6666], [-1.52922, 18.5148], [-1.59737, 18.3511], [-1.66659, 18.1661], [-1.74309, 17.9513], [-1.8336, 17.7034], [-1.94287, 17.4279], [-2.07092, 17.1387], [-2.2128, 16.8525], [-2.36146, 16.5833], [-2.51212, 16.3396], [-2.66534, 16.1248], [-2.82654, 15.9391], [-3.00181, 15.7792], [-3.19204, 15.6373], [-3.39004, 15.5036], [-3.5836, 15.3697], [-3.76283, 15.232], [-3.92588, 15.0903], [-4.0786, 14.9424], [-4.22925, 14.7803], [-4.38325, 14.5908], [-4.54247, 14.3608], [-4.70892, 14.0825], [-4.88942, 13.7542], [-5.09632, 13.3761], [-5.34192, 12.9479], [-5.62904, 12.4699], [-5.94531, 11.9488], [-6.26697, 11.4003], [-6.57004, 10.8482], [-6.8408, 10.319], [-7.07929, 9.83461], [-7.29556, 9.40499], [-7.50157, 9.02568], [-7.70299, 8.68327], [-7.8959, 8.36475], [-8.07105, 8.0638], [-8.22214, 7.78104], [-8.35063, 7.52096], [-8.46345, 7.28875], [-8.56764, 7.0879], [-8.66778, 6.91778], [-8.76767, 6.77148], [-8.8725, 6.63422], [-8.98878, 6.48373], [-9.12206, 6.29465], [-9.27463, 6.04779], [-9.44449, 5.74017], [-9.62607, 5.38879], [-9.8122, 5.0234], [-9.99627, 4.67235], [-10.1735, 4.35116], [-10.3417, 4.06058], [-10.5018, 3.79242], [-10.6578, 3.53644], [-10.815, 3.28328], [-10.9767, 3.02401], [-11.1434, 2.74885], [-11.3138, 2.44761], [-11.4874, 2.11172], [-11.6632, 1.73693], [-11.8362, 1.32482], [-11.9945, 0.882597], [-12.1214, 0.421669], [-12.2029, -0.0435495], [-12.2351, -0.496003], [-12.2265, -0.917097], [-12.1943, -1.29055], [-12.1569, -1.60857], [-12.1266, -1.87687], [-12.1073, -2.1145], [-12.0967, -2.34759], [-12.0909, -2.59901], [-12.0875, -2.87817], [-12.0856, -3.17605], [-12.0861, -3.46997], [-12.0925, -3.73656], [-12.1112, -3.9645], [-12.1497, -4.15813], [-12.2116, -4.33142], [-12.2942, -4.49885], [-12.3892, -4.66958], [-12.4867, -4.84605], [-12.5789, -5.02531], [-12.6606, -5.20235], [-12.7288, -5.37373], [-12.7815, -5.53935], [-12.8185, -5.70088], [-12.8435, -5.85884], [-12.8642, -6.0113], [-12.8893, -6.1556], [-12.9224, -6.29146], [-12.9583, -6.42228], [-12.9864, -6.5533], [-12.9974, -6.68803], [-12.988, -6.82606], [-12.9604, -6.96409], [-12.9194, -7.09841], [-12.8724, -7.22642], [-12.831, -7.34645], [-12.8093, -7.45742], [-12.8148, -7.55961], [-12.8398, -7.65585], [-12.861, -7.75107], [-12.8495, -7.84998], [-12.7854, -7.95458], [-12.6653, -8.06416], [-12.5022, -8.17808], [-12.3198, -8.29903], [-12.1459, -8.43379], [-12.0041, -8.59081], [-11.906, -8.77737], [-11.8454, -8.99865], [-11.8024, -9.2581], [-11.7546, -9.55546], [-11.6892, -9.88234], [-11.6065, -10.2202], [-11.5161, -10.5458], [-11.4302, -10.8414], [-11.3573, -11.1035], [-11.2972, -11.3431], [-11.2405, -11.58], [-11.1731, -11.8332], [-11.0851, -12.1128], [-10.9782, -12.4156], [-10.866, -12.7285], [-10.7644, -13.0358], [-10.6807, -13.3279], [-10.6062, -13.6054], [-10.5197, -13.877], [-10.3986, -14.1556], [-10.231, -14.4518], [-10.019, -14.7696], [-9.7739, -15.1036], [-9.50815, -15.4379], [-9.23223, -15.7506], [-8.95555, -16.0226], [-8.68614, -16.2465], [-8.42687, -16.4312], [-8.17294, -16.5961], [-7.91555, -16.7611], [-7.64966, -16.9383], [-7.37826, -17.1308], [-7.10939, -17.3374], [-6.84962, -17.559], [-6.59971, -17.8041], [-6.35454, -18.091], [-6.10578, -18.4465], [-5.84646, -18.8977], [-5.57751, -19.4544], [-5.31332, -20.0928], [-5.07946, -20.7551], [-4.9004, -21.3738], [-4.78492, -21.9043], [-4.72093, -22.3411], [-4.6835, -22.7074], [-4.64854, -23.0316], [-4.60187, -23.3294], [-4.53922, -23.5999], [-4.46074, -23.8303], [-4.36578, -24.0055], [-4.25089, -24.1171], [-4.11027, -24.1713], [-3.93791, -24.1902], [-3.73176, -24.2033], [-3.49915, -24.2312], [-3.25921, -24.2714], [-3.03757, -24.2961], [-2.85466, -24.2676], [-2.71541, -24.1588], [-2.60844, -23.9622], [-2.5152, -23.6777], [-2.42195, -23.2904], [-2.32518, -22.7628], [-2.22734, -22.0581], [-2.12804, -21.1793], [-2.01909, -20.1875], [-1.88796, -19.1792], [-1.72615, -18.24], [-1.53476, -17.4131], [-1.32269, -16.7014], [-1.1003, -16.0884], [-0.874376, -15.5549], [-0.646564, -15.0844], [-0.412728, -14.6623], [-0.162371, -14.2745], [0.118432, -13.9069], [0.437826, -13.5483], [0.78743, -13.195], [1.13984, -12.8535], [1.45894, -12.5358], [1.71665, -12.2513], [1.90496, -11.9993], [2.03782, -11.7689], [2.14479, -11.5435], [2.26081, -11.3054], [2.41465, -11.0385], [2.61883, -10.731], [2.86575, -10.3772], [3.13293, -9.98036], [3.39433, -9.55373], [3.63087, -9.11958], [3.83492, -8.7049], [4.00901, -8.33342], [4.16189, -8.01644], [4.30401, -7.74663], [4.44318, -7.49923], [4.58137, -7.24097], [4.71483, -6.94304], [4.83826, -6.59181], [4.95091, -6.19061], [5.06067, -5.74888], [5.18352, -5.26098], [5.3388, -4.68715], [5.54274, -3.95538], [5.80235, -2.99549], [6.11142, -1.79066], [6.45018, -0.408993], [6.78998, 1.01337], [7.10169, 2.32818], [7.36418, 3.43108], [7.56883, 4.28566], [7.71799, 4.91335], [7.81921, 5.36711], [7.88006, 5.70627], [7.90757, 5.98122], [7.91202, 6.22881], [7.91038, 6.47525], [7.92429, 6.74011], [7.97288, 7.03653], [8.06507, 7.36705], [8.19695, 7.72015], [8.35563, 8.07296], [8.52631, 8.40133], [8.69826, 8.69143], [8.86757, 8.94609], [9.03639, 9.18305], [9.20865, 9.42694], [9.38396, 9.6985], [9.55407, 10.005], [9.70582, 10.3361], [9.82882, 10.6691], [9.92175, 10.9806], [9.9928, 11.2592], [10.0561, 11.5091], [10.1272, 11.7438], [10.2186, 11.9752], [10.3341, 12.206], [10.4653, 12.4299], [10.5932, 12.6382], [10.699, 12.8267], [10.7744, 12.9985], [10.8261, 13.1626], [10.8682, 13.3307], [10.9112, 13.512], [10.9562, 13.7092], [10.9981, 13.9164], [11.0333, 14.1208], [11.0602, 14.3088], [11.0751, 14.4742], [11.068, 14.6227], [11.0282, 14.7706], [10.9539, 14.9379], [10.8577, 15.1407], [10.7606, 15.3877], [10.6798, 15.6804], [10.6216, 16.0162], [10.5851, 16.3894], [10.5709, 16.7903], [10.5883, 17.2078], [10.6555, 17.6348], [10.7948, 18.0721], [11.0224, 18.5236], [11.3355, 18.9861], [11.7031, 19.441], [12.068, 19.8573], [12.3644, 20.2048], [12.5429, 20.4677], [12.5893, 20.6501], [12.5242, 20.7735], [12.3886, 20.8694], [12.2256, 20.9704], [12.0668, 21.1008], [11.9255, 21.2704], [11.7926, 21.4735], [11.6355, 21.6961], [11.4076, 21.9256], [11.0719, 22.1554]];
    actual = midpt_smooth(taiwan, 20, true);

    assertEqualPoints(expected, actual);
}

test_midpt_smooth();