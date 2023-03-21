include <BOSL2/std.scad>
include <constants.scad>
use <cap.scad>

REFLECTIVE_COVER_OPENING = 20;
ALGAE_COVER_OPENING = REFLECTIVE_COVER_OPENING;

module algae_cover(anchor=CENTER, spin=0, orient=UP) {
  attachable(anchor, spin, orient, d=CAP_EXTERNAL_DIAMETER, l=CAP_HEIGHT) {
    difference() {
        cap();
        chain_hull() {
            cyl(d=ALGAE_COVER_OPENING, l=30);
            fwd(30) cyl(d=ALGAE_COVER_OPENING, l=30);
        }
    }
    children();
  }
}

algae_cover();