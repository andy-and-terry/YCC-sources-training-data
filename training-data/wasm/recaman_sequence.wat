(module
  (memory (export "memory") 1)

  ;; Writes the first $count terms as i32s at address 0.
  ;; A byte table at address 1024 marks the values already visited.
  (func $recaman (export "recaman") (param $count i32)
    (local $i i32) (local $prev i32) (local $next i32)
    (i32.store8 (i32.const 1024) (i32.const 1))
    (local.set $i (i32.const 1))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $i) (local.get $count)))
        (local.set $next (i32.sub (local.get $prev) (local.get $i)))
        (if (i32.or
              (i32.le_s (local.get $next) (i32.const 0))
              (i32.and
                (i32.gt_s (local.get $next) (i32.const 0))
                (i32.load8_u (i32.add (i32.const 1024) (local.get $next)))))
          (then (local.set $next (i32.add (local.get $prev) (local.get $i)))))
        (i32.store8 (i32.add (i32.const 1024) (local.get $next)) (i32.const 1))
        (i32.store (i32.shl (local.get $i) (i32.const 2)) (local.get $next))
        (local.set $prev (local.get $next))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop))))
)
