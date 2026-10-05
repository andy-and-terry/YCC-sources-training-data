(module
  (func $clamp (export "clamp") (param $x i32) (param $lo i32) (param $hi i32) (result i32)
    (select
      (local.get $lo)
      (select
        (local.get $hi)
        (local.get $x)
        (i32.gt_s (local.get $x) (local.get $hi)))
      (i32.lt_s (local.get $x) (local.get $lo))))

  (func $clamp_f32 (export "clamp_f32") (param $x f32) (param $lo f32) (param $hi f32) (result f32)
    (f32.min (f32.max (local.get $x) (local.get $lo)) (local.get $hi)))
)
