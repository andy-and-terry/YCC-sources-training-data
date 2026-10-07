(module
  (memory (export "memory") 1)

  (func $prefix_sum (export "prefix_sum") (param $base i32) (param $len i32)
    (local $i i32)
    (local $addr i32)
    (local $prev_addr i32)
    (local.set $i (i32.const 1))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $i) (local.get $len)))
        (local.set $addr (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4))))
        (local.set $prev_addr (i32.add (local.get $base) (i32.mul (i32.sub (local.get $i) (i32.const 1)) (i32.const 4))))
        (i32.store (local.get $addr) (i32.add (i32.load (local.get $addr)) (i32.load (local.get $prev_addr))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop))))
)
