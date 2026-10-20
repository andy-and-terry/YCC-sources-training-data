(module
  (func $fact (export "fact") (param $n i64) (result i64)
    (if (result i64) (i64.le_u (local.get $n) (i64.const 1))
      (then (i64.const 1))
      (else (i64.mul (local.get $n)
              (call $fact (i64.sub (local.get $n) (i64.const 1))))))))
