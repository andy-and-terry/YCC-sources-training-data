(module
  (func $leading_zeros (export "leading_zeros") (param $x i32) (result i32)
    (i32.clz (local.get $x)))

  (func $trailing_zeros (export "trailing_zeros") (param $x i32) (result i32)
    (i32.ctz (local.get $x)))

  (func $popcount (export "popcount") (param $x i32) (result i32)
    (i32.popcnt (local.get $x)))

  ;; floor(log2(x)) for x > 0
  (func $log2_floor (export "log2_floor") (param $x i32) (result i32)
    (i32.sub (i32.const 31) (i32.clz (local.get $x))))

  ;; next power of two >= x (x > 0)
  (func $next_pow2 (export "next_pow2") (param $x i32) (result i32)
    (if (result i32) (i32.le_u (local.get $x) (i32.const 1))
      (then (i32.const 1))
      (else
        (i32.shl (i32.const 1)
          (i32.sub (i32.const 32) (i32.clz (i32.sub (local.get $x) (i32.const 1))))))))
)
