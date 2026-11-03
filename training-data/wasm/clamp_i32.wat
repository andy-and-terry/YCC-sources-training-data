(module
  (func $clamp (export "clamp") (param $x i32) (param $lo i32) (param $hi i32) (result i32)
    (select
      (local.get $lo)
      (select (local.get $hi) (local.get $x) (i32.gt_s (local.get $x) (local.get $hi)))
      (i32.lt_s (local.get $x) (local.get $lo)))))
