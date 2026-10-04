(module
  (func $abs (export "abs") (param $x i32) (result i32)
    (if (result i32) (i32.lt_s (local.get $x) (i32.const 0))
      (then (i32.sub (i32.const 0) (local.get $x)))
      (else (local.get $x))))

  (func $abs_f64 (export "abs_f64") (param $x f64) (result f64)
    (f64.abs (local.get $x)))

  (func $abs_diff (export "abs_diff") (param $a i32) (param $b i32) (result i32)
    (call $abs (i32.sub (local.get $a) (local.get $b))))
)
