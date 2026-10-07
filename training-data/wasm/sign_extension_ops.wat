(module
  ;; Sign-extend the low 8 bits of an i32
  (func (export "extend8") (param $x i32) (result i32)
    (i32.extend8_s (local.get $x)))

  ;; Sign-extend the low 16 bits of an i32
  (func (export "extend16") (param $x i32) (result i32)
    (i32.extend16_s (local.get $x)))

  ;; Sign-extend an i32 into an i64
  (func (export "extend32_to_64") (param $x i32) (result i64)
    (i64.extend_i32_s (local.get $x)))

  ;; Zero-extend an i32 into an i64
  (func (export "zero_extend") (param $x i32) (result i64)
    (i64.extend_i32_u (local.get $x)))
)
