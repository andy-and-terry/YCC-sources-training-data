(module
  (memory (export "memory") 1)

  (func $at (param $i i32) (result i32)
    (i32.load (i32.shl (local.get $i) (i32.const 2))))

  ;; Writes the first $count (>= 2) terms as i32s at address 0.
  (func (export "stern") (param $count i32)
    (local $n i32) (local $half i32)
    (i32.store (i32.const 0) (i32.const 0))
    (i32.store (i32.const 4) (i32.const 1))
    (local.set $n (i32.const 2))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $n) (local.get $count)))
        (local.set $half (i32.shr_u (local.get $n) (i32.const 1)))
        (i32.store
          (i32.shl (local.get $n) (i32.const 2))
          (if (result i32) (i32.and (local.get $n) (i32.const 1))
            (then
              (i32.add
                (call $at (local.get $half))
                (call $at (i32.add (local.get $half) (i32.const 1)))))
            (else (call $at (local.get $half)))))
        (local.set $n (i32.add (local.get $n) (i32.const 1)))
        (br $loop))))
)
