(module
  (func (export "sign") (param $x i32) (result i32)
    (if (result i32) (i32.lt_s (local.get $x) (i32.const 0))
      (then (i32.const -1))
      (else
        (if (result i32) (i32.eqz (local.get $x))
          (then (i32.const 0))
          (else (i32.const 1))))))
)
