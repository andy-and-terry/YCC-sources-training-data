(module
  (func $clamp (export "clamp") (param $x i32) (param $lo i32) (param $hi i32) (result i32)
    (local $r i32)
    (local.set $r (local.get $x))
    (if (i32.lt_s (local.get $r) (local.get $lo))
      (then (local.set $r (local.get $lo))))
    (if (i32.gt_s (local.get $r) (local.get $hi))
      (then (local.set $r (local.get $hi))))
    (local.get $r))

  (func $clamp_select (export "clamp_select") (param $x i32) (param $lo i32) (param $hi i32) (result i32)
    (local $t i32)
    (local.set $t
      (select (local.get $x) (local.get $lo) (i32.ge_s (local.get $x) (local.get $lo))))
    (select (local.get $t) (local.get $hi) (i32.le_s (local.get $t) (local.get $hi))))

  (func $clamp_f64 (export "clamp_f64") (param $x f64) (param $lo f64) (param $hi f64) (result f64)
    (f64.min (f64.max (local.get $x) (local.get $lo)) (local.get $hi)))
)
