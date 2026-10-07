(module
  ;; View the raw IEEE-754 bits of a float
  (func (export "f32_bits") (param $x f32) (result i32)
    (i32.reinterpret_f32 (local.get $x)))

  (func (export "bits_to_f32") (param $x i32) (result f32)
    (f32.reinterpret_i32 (local.get $x)))

  ;; Absolute value by clearing the sign bit
  (func (export "fast_abs") (param $x f32) (result f32)
    (f32.reinterpret_i32
      (i32.and
        (i32.reinterpret_f32 (local.get $x))
        (i32.const 0x7fffffff))))

  ;; Extract the unbiased exponent
  (func (export "exponent") (param $x f32) (result i32)
    (i32.sub
      (i32.and
        (i32.shr_u (i32.reinterpret_f32 (local.get $x)) (i32.const 23))
        (i32.const 0xff))
      (i32.const 127)))
)
