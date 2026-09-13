(module
  (func $factorial_i64 (export "factorial_i64") (param $n i64) (result i64)
    (if (result i64)
      (i64.le_s (local.get $n) (i64.const 1))
      (then (i64.const 1))
      (else
        (i64.mul
          (local.get $n)
          (call $factorial_i64 (i64.sub (local.get $n) (i64.const 1)))))))
)
