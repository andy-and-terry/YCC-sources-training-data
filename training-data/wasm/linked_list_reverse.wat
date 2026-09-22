(module
  (memory (export "memory") 1)

  ;; each node is 8 bytes: word 0 holds the value, word 1 holds the next
  ;; node's address, or -1 to mark the end of the list.
  (func $list_reverse (export "list_reverse") (param $head i32) (result i32)
    (local $prev i32)
    (local $curr i32)
    (local $next i32)
    (local.set $prev (i32.const -1))
    (local.set $curr (local.get $head))
    (block $done
      (loop $loop
        (br_if $done (i32.eq (local.get $curr) (i32.const -1)))
        (local.set $next (i32.load (i32.add (local.get $curr) (i32.const 4))))
        (i32.store (i32.add (local.get $curr) (i32.const 4)) (local.get $prev))
        (local.set $prev (local.get $curr))
        (local.set $curr (local.get $next))
        (br $loop)))
    (local.get $prev))
)
