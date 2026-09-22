(module
  (memory (export "memory") 1)

  (func $string_reverse (export "string_reverse") (param $ptr i32)
    (local $len i32)
    (local $low i32)
    (local $high i32)
    (local $tmp i32)
    (local.set $len (i32.const 0))
    (block $len_done
      (loop $count
        (br_if $len_done (i32.eqz (i32.load8_u (i32.add (local.get $ptr) (local.get $len)))))
        (local.set $len (i32.add (local.get $len) (i32.const 1)))
        (br $count)))
    (local.set $low (local.get $ptr))
    (local.set $high (i32.sub (i32.add (local.get $ptr) (local.get $len)) (i32.const 1)))
    (block $swap_done
      (loop $swap
        (br_if $swap_done (i32.ge_s (local.get $low) (local.get $high)))
        (local.set $tmp (i32.load8_u (local.get $low)))
        (i32.store8 (local.get $low) (i32.load8_u (local.get $high)))
        (i32.store8 (local.get $high) (local.get $tmp))
        (local.set $low (i32.add (local.get $low) (i32.const 1)))
        (local.set $high (i32.sub (local.get $high) (i32.const 1)))
        (br $swap))))
)
