(module
  (func $bitwise_demo (export "bitwise_demo") (param $a i32) (param $b i32) (result i32)
    (i32.xor
      (i32.or
        (i32.and (local.get $a) (local.get $b))
        (i32.shl (local.get $a) (i32.const 1)))
      (i32.shr_u (local.get $b) (i32.const 1))))
)
