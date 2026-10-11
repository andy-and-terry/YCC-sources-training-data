(module
  ;; n is a power of 4 if it is a power of 2 and its single bit is at an even position.
  (func $is_power_of_four (export "is_power_of_four") (param $n i32) (result i32)
    (i32.and
      (i32.and
        (i32.gt_s (local.get $n) (i32.const 0))
        (i32.eqz (i32.and (local.get $n) (i32.sub (local.get $n) (i32.const 1)))))
      (i32.ne (i32.and (local.get $n) (i32.const 0x55555555)) (i32.const 0)))))
