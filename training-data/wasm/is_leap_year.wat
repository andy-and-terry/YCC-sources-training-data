(module
  (func (export "is_leap") (param $y i32) (result i32)
    (i32.or
      (i32.and
        (i32.eqz (i32.rem_u (local.get $y) (i32.const 4)))
        (i32.ne  (i32.rem_u (local.get $y) (i32.const 100)) (i32.const 0)))
      (i32.eqz (i32.rem_u (local.get $y) (i32.const 400))))))
