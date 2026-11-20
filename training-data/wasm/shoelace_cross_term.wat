(module
  ;; One shoelace cross term: x1*y2 - x2*y1.
  (func (export "cross") (param $x1 i32) (param $y1 i32) (param $x2 i32) (param $y2 i32) (result i32)
    (i32.sub
      (i32.mul (local.get $x1) (local.get $y2))
      (i32.mul (local.get $x2) (local.get $y1)))))
