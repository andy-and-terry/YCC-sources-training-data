(module
  (func $widen_signed (export "widen_signed") (param $x i32) (result i64)
    (i64.extend_i32_s (local.get $x)))

  (func $widen_unsigned (export "widen_unsigned") (param $x i32) (result i64)
    (i64.extend_i32_u (local.get $x)))

  (func $narrow (export "narrow") (param $x i64) (result i32)
    (i32.wrap_i64 (local.get $x)))
)
