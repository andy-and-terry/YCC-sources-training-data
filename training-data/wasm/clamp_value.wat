(module
  (func (export "clamp") (param $x i32) (param $lo i32) (param $hi i32) (result i32)
    (select
      (local.get $lo)
      (select
        (local.get $hi)
        (local.get $x)
        (i32.gt_s (local.get $x) (local.get $hi)))
      (i32.lt_s (local.get $x) (local.get $lo))))

  (func (export "clamp_f32") (param $x f32) (param $lo f32) (param $hi f32) (result f32)
    (f32.min (f32.max (local.get $x) (local.get $lo)) (local.get $hi)))

  ;; Clamp to the byte range 0..255
  (func (export "clamp_u8") (param $x i32) (result i32)
    (i32.and
      (select
        (i32.const 255)
        (select (i32.const 0) (local.get $x) (i32.lt_s (local.get $x) (i32.const 0)))
        (i32.gt_s (local.get $x) (i32.const 255)))
      (i32.const 255)))
)
