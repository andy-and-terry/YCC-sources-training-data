(module
  (func $clamp (export "clamp") (param $x i32) (param $lo i32) (param $hi i32) (result i32)
    (local $r i32)
    (local.set $r
      (select (local.get $lo) (local.get $x) (i32.lt_s (local.get $x) (local.get $lo))))
    (select (local.get $hi) (local.get $r) (i32.gt_s (local.get $r) (local.get $hi))))

  (func $clamp_f64 (export "clamp_f64") (param $x f64) (param $lo f64) (param $hi f64) (result f64)
    (f64.min (f64.max (local.get $x) (local.get $lo)) (local.get $hi)))
)
