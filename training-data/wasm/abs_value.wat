(module
  (func $abs_i32 (export "abs_i32") (param $x i32) (result i32)
    (if (result i32) (i32.lt_s (local.get $x) (i32.const 0))
      (then (i32.sub (i32.const 0) (local.get $x)))
      (else (local.get $x))))

  ;; branch-free: (x ^ m) - m where m = x >> 31
  (func $abs_branchless (export "abs_branchless") (param $x i32) (result i32)
    (local $m i32)
    (local.set $m (i32.shr_s (local.get $x) (i32.const 31)))
    (i32.sub (i32.xor (local.get $x) (local.get $m)) (local.get $m)))

  (func $abs_f64 (export "abs_f64") (param $x f64) (result f64)
    (f64.abs (local.get $x)))

  (func $sign (export "sign") (param $x i32) (result i32)
    (i32.sub
      (i32.gt_s (local.get $x) (i32.const 0))
      (i32.lt_s (local.get $x) (i32.const 0))))
)
