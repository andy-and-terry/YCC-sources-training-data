(module
  (memory (export "memory") 1)

  ;; each node is 8 bytes: word 0 holds the value, word 1 holds the next
  ;; node's address, or -1 to mark the end of the list.
  (func $list_sum (export "list_sum") (param $head i32) (result i32)
    (local $node i32)
    (local $total i32)
    (local.set $node (local.get $head))
    (local.set $total (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.eq (local.get $node) (i32.const -1)))
        (local.set $total (i32.add (local.get $total) (i32.load (local.get $node))))
        (local.set $node (i32.load (i32.add (local.get $node) (i32.const 4))))
        (br $loop)))
    (local.get $total))
)
