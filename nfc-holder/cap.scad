include <index.scad>

module cap()
{
    union()
    {
        cylinder(h = thickness, d = nfc_diameter + padding);
        translate([ 0, 0, thickness ]) cylinder(h = padding / 2, d = nfc_diameter);
        translate([ 0, 0, thickness ]) rotate_extrude(convexity = 10) translate([ nfc_diameter / 2, 0, 0 ])
            circle(d = padding, $fn = 100);
    }
}