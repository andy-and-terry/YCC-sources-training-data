;; Bulls: count of positions where two 4-digit strings in linear memory match
(module
  (memory (export "memory") 1)
  (data (i32.const 0) "1807")
  (data (i32.const 4) "7810")

  (func (export "bulls") (result i32)
    (local $i i32) (local $count i32)
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $i) (i32.const 4)))
        (if (i32.eq (i32.load8_u (local.get $i))
                    (i32.load8_u (i32.add (local.get $i) (i32.const 4))))
          (then (local.set $count (i32.add (local.get $count) (i32.const 1)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (local.get $count)))
