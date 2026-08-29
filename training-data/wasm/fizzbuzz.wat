(module
  (func $fizzbuzz_code (export "fizzbuzz_code") (param $n i32) (result i32)
    (if (result i32) (i32.eqz (i32.rem_s (local.get $n) (i32.const 15)))
      (then (i32.const 0))
      (else
        (if (result i32) (i32.eqz (i32.rem_s (local.get $n) (i32.const 3)))
          (then (i32.const 1))
          (else
            (if (result i32) (i32.eqz (i32.rem_s (local.get $n) (i32.const 5)))
              (then (i32.const 2))
              (else (i32.const 3))))))))
)
