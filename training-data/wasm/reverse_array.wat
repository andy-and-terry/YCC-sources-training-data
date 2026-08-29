(module
  (memory (export "memory") 1)

  (func $reverse_array (export "reverse_array") (param $base i32) (param $len i32)
    (local $low i32)
    (local $high i32)
    (local $temp i32)
    (local $addr_low i32)
    (local $addr_high i32)
    (local.set $low (i32.const 0))
    (local.set $high (i32.sub (local.get $len) (i32.const 1)))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $low) (local.get $high)))
        (local.set $addr_low (i32.add (local.get $base) (i32.mul (local.get $low) (i32.const 4))))
        (local.set $addr_high (i32.add (local.get $base) (i32.mul (local.get $high) (i32.const 4))))
        (local.set $temp (i32.load (local.get $addr_low)))
        (i32.store (local.get $addr_low) (i32.load (local.get $addr_high)))
        (i32.store (local.get $addr_high) (local.get $temp))
        (local.set $low (i32.add (local.get $low) (i32.const 1)))
        (local.set $high (i32.sub (local.get $high) (i32.const 1)))
        (br $loop))))
)
