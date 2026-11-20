(module
  (memory (export "mem") 1)
  (data (i32.const 0) "aabbbcdd")
  ;; Count runs of equal bytes in the first n bytes of memory.
  (func (export "runs") (param $n i32) (result i32)
    (local $i i32) (local $c i32)
    (local.set $c (i32.const 1))
    (local.set $i (i32.const 1))
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (if (i32.ne (i32.load8_u (local.get $i)) (i32.load8_u (i32.sub (local.get $i) (i32.const 1))))
          (then (local.set $c (i32.add (local.get $c) (i32.const 1)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (local.get $c)))
