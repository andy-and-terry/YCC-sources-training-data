(module
  (func (export "clamp") (param $x i32) (param $lo i32) (param $hi i32) (result i32)
    (local.set $x (select (local.get $lo) (local.get $x) (i32.lt_s (local.get $x) (local.get $lo))))
    (select (local.get $hi) (local.get $x) (i32.gt_s (local.get $x) (local.get $hi)))))
