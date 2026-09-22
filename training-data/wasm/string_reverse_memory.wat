(module
  (memory (export "memory") 1)

  (func $string_reverse (export "string_reverse") (param $base i32) (param $len i32)
    (local $low i32)
    (local $high i32)
    (local $temp i32)
    (local.set $low (i32.const 0))
    (local.set $high (i32.sub (local.get $len) (i32.const 1)))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $low) (local.get $high)))
        (local.set $temp (i32.load8_u (i32.add (local.get $base) (local.get $low))))
        (i32.store8
          (i32.add (local.get $base) (local.get $low))
          (i32.load8_u (i32.add (local.get $base) (local.get $high))))
        (i32.store8 (i32.add (local.get $base) (local.get $high)) (local.get $temp))
        (local.set $low (i32.add (local.get $low) (i32.const 1)))
        (local.set $high (i32.sub (local.get $high) (i32.const 1)))
        (br $loop))))
)
