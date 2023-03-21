include <BOSL2/std.scad>
include <constants.scad>

module cap(anchor=CENTER, spin=0, orient=UP) {
  diff("column")
  attachable(anchor, spin, orient, d=CAP_EXTERNAL_DIAMETER, l=CAP_HEIGHT) {
    difference() {
      cyl(d=CAP_EXTERNAL_DIAMETER, l=CAP_HEIGHT, rounding1=CAP_ROUNDING);
      up(CAP_THICKNESS)
        cyl(d=CAP_INTERNAL_DIAMETER, l=CAP_HEIGHT);
    }
    attach(FRONT+TOP, overlap=-(GARDYN_OPENING_LIP * SLOP_SMALLER)) {
      tag("column")  cyl(d=GARDYN_COLUMN_DIAMETER * SLOP_LARGER, l=(CAP_HEIGHT * 2));
    };
  }
}

cap();