(module
  (memory (export "memory") 1)

  (func $insertion_sort (export "insertion_sort") (param $base i32) (param $len i32)
    (local $i i32)
    (local $j i32)
    (local $key i32)
    (local $addr i32)
    (local.set $i (i32.const 1))
    (block $outer_done
      (loop $outer
        (br_if $outer_done (i32.ge_s (local.get $i) (local.get $len)))
        (local.set $key (i32.load (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4)))))
        (local.set $j (i32.sub (local.get $i) (i32.const 1)))
        (block $inner_done
          (loop $inner
            (br_if $inner_done (i32.lt_s (local.get $j) (i32.const 0)))
            (local.set $addr (i32.add (local.get $base) (i32.mul (local.get $j) (i32.const 4))))
            (br_if $inner_done (i32.le_s (i32.load (local.get $addr)) (local.get $key)))
            (i32.store (i32.add (local.get $addr) (i32.const 4)) (i32.load (local.get $addr)))
            (local.set $j (i32.sub (local.get $j) (i32.const 1)))
            (br $inner)))
        (i32.store (i32.add (local.get $base) (i32.mul (i32.add (local.get $j) (i32.const 1)) (i32.const 4))) (local.get $key))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $outer))))
)
