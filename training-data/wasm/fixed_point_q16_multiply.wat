(module
  ;; Q16.16 fixed-point multiply: (a * b) >> 16 computed in 64 bits.
  (func $q16_mul (export "q16_mul") (param $a i32) (param $b i32) (result i32)
    (i32.wrap_i64
      (i64.shr_s
        (i64.mul (i64.extend_i32_s (local.get $a)) (i64.extend_i32_s (local.get $b)))
        (i64.const 16))))

  (func $q16_from_int (export "q16_from_int") (param $n i32) (result i32)
    (i32.shl (local.get $n) (i32.const 16)))

  (func $q16_to_int (export "q16_to_int") (param $q i32) (result i32)
    (i32.shr_s (local.get $q) (i32.const 16))))
