(module
  (func $bit_reverse (export "bit_reverse") (param $x i32) (result i32)
    (local $result i32)
    (local $n i32)
    (local $i i32)
    (local.set $n (local.get $x))
    (local.set $result (i32.const 0))
    (local.set $i (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $i) (i32.const 32)))
        (local.set $result
          (i32.or
            (i32.shl (local.get $result) (i32.const 1))
            (i32.and (local.get $n) (i32.const 1))))
        (local.set $n (i32.shr_u (local.get $n) (i32.const 1)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop)))
    (local.get $result))
)
