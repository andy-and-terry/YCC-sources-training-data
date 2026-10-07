(module
  (func $bswap32 (export "bswap32") (param $x i32) (result i32)
    (i32.or
      (i32.or
        (i32.shl (i32.and (local.get $x) (i32.const 0xff)) (i32.const 24))
        (i32.shl (i32.and (local.get $x) (i32.const 0xff00)) (i32.const 8)))
      (i32.or
        (i32.and (i32.shr_u (local.get $x) (i32.const 8)) (i32.const 0xff00))
        (i32.shr_u (local.get $x) (i32.const 24)))))

  (func $bswap16 (export "bswap16") (param $x i32) (result i32)
    (i32.or
      (i32.shl (i32.and (local.get $x) (i32.const 0xff)) (i32.const 8))
      (i32.and (i32.shr_u (local.get $x) (i32.const 8)) (i32.const 0xff))))
)
