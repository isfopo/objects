include <cap.scad>
include <index.scad>
use <../libraries/threads-scad/threads.scad>

module bottom()
{
    ScrewHole(nfc_diameter, screw_depth + nfc_thinkness, pitch = screw_pitch, tooth_angle = thread_angle) cap();
}