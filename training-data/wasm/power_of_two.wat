(module
  (func $is_power_of_two (export "is_power_of_two") (param $n i32) (result i32)
    (i32.and
      (i32.gt_s (local.get $n) (i32.const 0))
      (i32.eqz (i32.and (local.get $n) (i32.sub (local.get $n) (i32.const 1))))))
)
