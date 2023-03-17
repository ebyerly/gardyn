include <constants.scad>
use <cap.scad>

$fa = 1;

REFLECTIVE_COVER_OPENING = 20;
GOOSE = 2;
ALGAE_COVER_OPENING = REFLECTIVE_COVER_OPENING - (GOOSE * 2);

module algae_cover() {
    difference() {
        cap();
        chain_hull() {
            cyl(d=ALGAE_COVER_OPENING, l=30);
            fwd(30) cyl(d=ALGAE_COVER_OPENING, l=30);
        }
    }
}

algae_cover();