(module
  (func (export "is_leap") (param $y i32) (result i32)
    (if (result i32) (i32.eqz (i32.rem_u (local.get $y) (i32.const 400)))
      (then (i32.const 1))
      (else
        (if (result i32) (i32.eqz (i32.rem_u (local.get $y) (i32.const 100)))
          (then (i32.const 0))
          (else (i32.eqz (i32.and (local.get $y) (i32.const 3))))))))
)
