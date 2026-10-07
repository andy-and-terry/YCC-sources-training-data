(module
  (func (export "rotl") (param $x i32) (param $n i32) (result i32)
    (i32.rotl (local.get $x) (local.get $n)))

  (func (export "rotr") (param $x i32) (param $n i32) (result i32)
    (i32.rotr (local.get $x) (local.get $n)))

  ;; swap the two 16-bit halves
  (func (export "swap_halves") (param $x i32) (result i32)
    (i32.rotl (local.get $x) (i32.const 16)))

  ;; reverse byte order
  (func (export "bswap32") (param $x i32) (result i32)
    (i32.or
      (i32.or
        (i32.shl (i32.and (local.get $x) (i32.const 0xff)) (i32.const 24))
        (i32.shl (i32.and (local.get $x) (i32.const 0xff00)) (i32.const 8)))
      (i32.or
        (i32.and (i32.shr_u (local.get $x) (i32.const 8)) (i32.const 0xff00))
        (i32.shr_u (local.get $x) (i32.const 24)))))
)
