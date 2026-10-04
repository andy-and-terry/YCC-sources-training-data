(module
  (func $rotl (export "rotl") (param $x i32) (param $n i32) (result i32)
    (i32.rotl (local.get $x) (local.get $n)))

  (func $rotr (export "rotr") (param $x i32) (param $n i32) (result i32)
    (i32.rotr (local.get $x) (local.get $n)))

  (func $rotl64 (export "rotl64") (param $x i64) (param $n i64) (result i64)
    (i64.rotl (local.get $x) (local.get $n)))

  ;; rotate left by hand using shifts, for comparison
  (func $rotl_manual (export "rotl_manual") (param $x i32) (param $n i32) (result i32)
    (local $k i32)
    (local.set $k (i32.and (local.get $n) (i32.const 31)))
    (i32.or
      (i32.shl (local.get $x) (local.get $k))
      (i32.shr_u (local.get $x) (i32.and (i32.sub (i32.const 32) (local.get $k)) (i32.const 31)))))
)
