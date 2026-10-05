(module
  (func $abs_i32 (export "abs_i32") (param $x i32) (result i32)
    (select
      (i32.sub (i32.const 0) (local.get $x))
      (local.get $x)
      (i32.lt_s (local.get $x) (i32.const 0))))

  (func $abs_f64 (export "abs_f64") (param $x f64) (result f64)
    (f64.abs (local.get $x)))
)
