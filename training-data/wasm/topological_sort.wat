(module
  (memory (export "memory") 1)

  (func $visit (export "visit")
        (param $node i32) (param $adj_base i32) (param $n i32) (param $visited_base i32) (param $order_base i32) (param $order_count_addr i32)
    (local $i i32)
    (if (i32.eqz (i32.load8_u (i32.add (local.get $visited_base) (local.get $node))))
      (then
        (i32.store8 (i32.add (local.get $visited_base) (local.get $node)) (i32.const 1))
        (local.set $i (i32.const 0))
        (block $done
          (loop $loop
            (br_if $done (i32.ge_s (local.get $i) (local.get $n)))
            (if (i32.load8_u (i32.add (local.get $adj_base) (i32.add (i32.mul (local.get $node) (local.get $n)) (local.get $i))))
              (then (call $visit (local.get $i) (local.get $adj_base) (local.get $n) (local.get $visited_base) (local.get $order_base) (local.get $order_count_addr))))
            (local.set $i (i32.add (local.get $i) (i32.const 1)))
            (br $loop)))
        (i32.store (i32.add (local.get $order_base) (i32.mul (i32.load (local.get $order_count_addr)) (i32.const 4))) (local.get $node))
        (i32.store (local.get $order_count_addr) (i32.add (i32.load (local.get $order_count_addr)) (i32.const 1))))))
)
