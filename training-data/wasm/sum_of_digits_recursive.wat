(module
  (func $sum_digits (export "sum_digits") (param $n i32) (result i32)
    (if (result i32) (i32.eqz (local.get $n))
      (then (i32.const 0))
      (else
        (i32.add
          (i32.rem_u (local.get $n) (i32.const 10))
          (call $sum_digits (i32.div_u (local.get $n) (i32.const 10))))))))
