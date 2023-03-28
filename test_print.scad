include <BOSL2/std.scad>

$fa = 1;

// Gardyn product measures
GARDYN_COLUMN_DIAMETER = 76.5;
GARDYN_OPENING_EXTERNAL_DIAMETER = 56;
GARDYN_OPENING_LIP = 5;

// Shared measures for Gardyn caps
CAP_THICKNESS = 2;
CAP_HEIGHT = 10;
CAP_ROUNDING = CAP_THICKNESS / 1.5;
ALGAE_COVER_OPENING = 20;

module cap(slop_percent=0.01, anchor=CENTER, spin=0, orient=UP) {
  slop_larger = 1 + slop_percent;
  slop_smaller = 1 - slop_percent;
  internal_diameter = GARDYN_OPENING_EXTERNAL_DIAMETER * slop_larger;
  external_diameter = internal_diameter + (CAP_THICKNESS * 2);
  diff("column")
  attachable(anchor, spin, orient, d=external_diameter, l=CAP_HEIGHT) {
    difference() {
      cyl(d=external_diameter, l=CAP_HEIGHT, rounding1=CAP_ROUNDING);
      up(CAP_THICKNESS)
        cyl(d=internal_diameter, l=CAP_HEIGHT);
    }
    attach(FRONT+TOP, overlap=-(GARDYN_OPENING_LIP * slop_smaller)) {
      tag("column")  cyl(d=GARDYN_COLUMN_DIAMETER * slop_larger, l=(CAP_HEIGHT * 2));
    };
  }
}

module algae_cover(slop_percent = 0.01, anchor=CENTER, spin=0, orient=UP) {
  slop_larger = 1 + slop_percent;
  slop_smaller = 1 - slop_percent;
  internal_diameter = GARDYN_OPENING_EXTERNAL_DIAMETER * slop_larger;
  external_diameter = internal_diameter + (CAP_THICKNESS * 2);
  attachable(anchor, spin, orient, d=external_diameter, l=CAP_HEIGHT) {
    difference() {
        cap(slop_percent=slop_percent, anchor=anchor, spin=spin, orient=orient);
        chain_hull() {
          cyl(d=ALGAE_COVER_OPENING, l=30);
            fwd(30) cyl(d=ALGAE_COVER_OPENING, l=30);
        }
    }
    children();
  }
}

algae_cover(slop_percent=0.005)
    position(RIGHT)
    right(3)
    cap(slop_percent=0.005, anchor=LEFT);

