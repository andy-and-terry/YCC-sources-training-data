(module
  (func (export "sat_add_u8") (param $a i32) (param $b i32) (result i32)
    (local $sum i32)
    (local.set $sum (i32.add (i32.and (local.get $a) (i32.const 255))
                             (i32.and (local.get $b) (i32.const 255))))
    (select
      (i32.const 255)
      (local.get $sum)
      (i32.gt_u (local.get $sum) (i32.const 255))))
)
