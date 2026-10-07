(module
  (func $clamp (export "clamp") (param $v i32) (param $lo i32) (param $hi i32) (result i32)
    (select
      (local.get $lo)
      (select
        (local.get $hi)
        (local.get $v)
        (i32.gt_s (local.get $v) (local.get $hi)))
      (i32.lt_s (local.get $v) (local.get $lo))))
)
