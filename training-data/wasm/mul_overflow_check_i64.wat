(module
  ;; Multiply two u32 values in 64-bit space; return 1 if the product fits in 32 bits.
  (func $fits_u32_product (export "fits_u32_product") (param $a i32) (param $b i32) (result i32)
    (i64.le_u
      (i64.mul (i64.extend_i32_u (local.get $a)) (i64.extend_i32_u (local.get $b)))
      (i64.const 0xFFFFFFFF))))
