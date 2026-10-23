(module
  (memory (export "memory") 1)

  ;; Writes the first $count terms as i32s at address 0.
  (func (export "van_eck") (param $count i32)
    (local $i i32) (local $j i32) (local $last i32) (local $next i32)
    (i32.store (i32.const 0) (i32.const 0))
    (block $done
      (loop $outer
        (br_if $done
          (i32.ge_s (i32.add (local.get $i) (i32.const 1)) (local.get $count)))
        (local.set $last (i32.load (i32.shl (local.get $i) (i32.const 2))))
        (local.set $next (i32.const 0))
        (local.set $j (i32.sub (local.get $i) (i32.const 1)))
        (block $found
          (loop $scan
            (br_if $found (i32.lt_s (local.get $j) (i32.const 0)))
            (if (i32.eq
                  (i32.load (i32.shl (local.get $j) (i32.const 2)))
                  (local.get $last))
              (then
                (local.set $next (i32.sub (local.get $i) (local.get $j)))
                (br $found)))
            (local.set $j (i32.sub (local.get $j) (i32.const 1)))
            (br $scan)))
        (i32.store
          (i32.shl (i32.add (local.get $i) (i32.const 1)) (i32.const 2))
          (local.get $next))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $outer))))
)
