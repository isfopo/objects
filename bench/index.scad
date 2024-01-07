low_poly = true;

height = 50; // mm
leg_length = 1000; // mm

leg_diameter = 38.1; // mm
outer_diameter = 65; // mm
wall_thickness = (outer_diameter-leg_diameter)/2;

spacing = 40; // mm

outward_angle = 10; // deg
side_angle = 16; // deg

screw_diameter = 4; // mm
screw_head_diameter = 8; // mm
screw_head_height = 2; // mm
screw_inset = low_poly ? 1.9 : 0; // mm

leg_type = "baluster"; // "dowel" | "baluster"
leg_fillet=5; //mm

module index() {

}

index();