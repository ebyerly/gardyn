include <BOSL2/std.scad>
include <constants.scad>

$fa = 1;

GOOSE = 0.1;

CAP_THICKNESS = 2;
CAP_HEIGHT = 10;
CAP_ROUNDING = CAP_THICKNESS / 1.5;
CAP_INTERNAL_DIAMETER = GARDYN_OPENING_EXTERNAL_DIAMETER + GOOSE;
CAP_EXTERNAL_DIAMETER = CAP_INTERNAL_DIAMETER + (CAP_THICKNESS * 2);

module cap(anchor=CENTER, spin=0, orient=UP) {
  diff("column")
  attachable(anchor, spin, orient, d=CAP_EXTERNAL_DIAMETER, l=CAP_HEIGHT) {
    difference() {
      cyl(d=CAP_EXTERNAL_DIAMETER, l=CAP_HEIGHT, rounding1=CAP_ROUNDING);
      up(CAP_THICKNESS)
        cyl(d=CAP_INTERNAL_DIAMETER, l=CAP_HEIGHT);
    }
    attach(FRONT+TOP, overlap=-(GARDYN_OPENING_LIP + GOOSE)) {
      tag("column")  cyl(d=GARDYN_COLUMN_DIAMETER, l=(CAP_HEIGHT * 2));
    };
  }
}

cap();