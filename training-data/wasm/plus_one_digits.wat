(module
  (memory (export "mem") 1)

  ;; Increments a big-endian decimal digit array (one byte per digit) in place.
  ;; Returns 1 if the number overflowed (all digits are now 0), else 0.
  (func $plus_one (export "plus_one") (param $ptr i32) (param $n i32) (result i32)
    (local $i i32) (local $d i32)
    (local.set $i (local.get $n))
    (block $done
      (loop $step
        (br_if $done (i32.eqz (local.get $i)))
        (local.set $i (i32.sub (local.get $i) (i32.const 1)))
        (local.set $d (i32.load8_u (i32.add (local.get $ptr) (local.get $i))))
        (if (i32.lt_u (local.get $d) (i32.const 9))
          (then
            (i32.store8 (i32.add (local.get $ptr) (local.get $i)) (i32.add (local.get $d) (i32.const 1)))
            (return (i32.const 0))))
        (i32.store8 (i32.add (local.get $ptr) (local.get $i)) (i32.const 0))
        (br $step)))
    (i32.const 1))
)
