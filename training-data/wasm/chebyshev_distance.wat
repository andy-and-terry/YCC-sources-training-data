(module
  (func $absdiff (param $a i32) (param $b i32) (result i32)
    (select
      (i32.sub (local.get $a) (local.get $b))
      (i32.sub (local.get $b) (local.get $a))
      (i32.ge_s (local.get $a) (local.get $b))))
  ;; Chebyshev distance: max of the coordinate differences
  (func (export "chebyshev") (param $x1 i32) (param $y1 i32) (param $x2 i32) (param $y2 i32) (result i32)
    (local $dx i32) (local $dy i32)
    (local.set $dx (call $absdiff (local.get $x1) (local.get $x2)))
    (local.set $dy (call $absdiff (local.get $y1) (local.get $y2)))
    (select (local.get $dx) (local.get $dy) (i32.gt_s (local.get $dx) (local.get $dy)))))
