(module
  (func $rotl (export "rotl") (param $x i32) (param $n i32) (result i32)
    (i32.rotl (local.get $x) (local.get $n)))

  (func $rotr (export "rotr") (param $x i32) (param $n i32) (result i32)
    (i32.rotr (local.get $x) (local.get $n)))

  ;; the same rotation built from shifts
  (func $rotl_manual (export "rotl_manual") (param $x i32) (param $n i32) (result i32)
    (local $k i32)
    (local.set $k (i32.and (local.get $n) (i32.const 31)))
    (i32.or
      (i32.shl (local.get $x) (local.get $k))
      (i32.shr_u (local.get $x) (i32.sub (i32.const 32) (local.get $k)))))

  (func $swap_halves (export "swap_halves") (param $x i32) (result i32)
    (i32.rotl (local.get $x) (i32.const 16)))

  (func $rotl64 (export "rotl64") (param $x i64) (param $n i64) (result i64)
    (i64.rotl (local.get $x) (local.get $n)))

  (func $byte_swap (export "byte_swap") (param $x i32) (result i32)
    (i32.or
      (i32.or
        (i32.shl (i32.and (local.get $x) (i32.const 0xFF)) (i32.const 24))
        (i32.shl (i32.and (local.get $x) (i32.const 0xFF00)) (i32.const 8)))
      (i32.or
        (i32.and (i32.shr_u (local.get $x) (i32.const 8)) (i32.const 0xFF00))
        (i32.shr_u (local.get $x) (i32.const 24)))))
)
