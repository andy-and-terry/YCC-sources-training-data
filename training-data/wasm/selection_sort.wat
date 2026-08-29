(module
  (memory (export "memory") 1)

  (func $selection_sort (export "selection_sort") (param $base i32) (param $len i32)
    (local $i i32)
    (local $j i32)
    (local $min_idx i32)
    (local $temp i32)
    (local $addr_i i32)
    (local $addr_min i32)
    (local.set $i (i32.const 0))
    (block $outer_done
      (loop $outer
        (br_if $outer_done (i32.ge_s (local.get $i) (i32.sub (local.get $len) (i32.const 1))))
        (local.set $min_idx (local.get $i))
        (local.set $j (i32.add (local.get $i) (i32.const 1)))
        (block $inner_done
          (loop $inner
            (br_if $inner_done (i32.ge_s (local.get $j) (local.get $len)))
            (if (i32.lt_s
                  (i32.load (i32.add (local.get $base) (i32.mul (local.get $j) (i32.const 4))))
                  (i32.load (i32.add (local.get $base) (i32.mul (local.get $min_idx) (i32.const 4)))))
              (then (local.set $min_idx (local.get $j))))
            (local.set $j (i32.add (local.get $j) (i32.const 1)))
            (br $inner)))
        (local.set $addr_i (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4))))
        (local.set $addr_min (i32.add (local.get $base) (i32.mul (local.get $min_idx) (i32.const 4))))
        (local.set $temp (i32.load (local.get $addr_i)))
        (i32.store (local.get $addr_i) (i32.load (local.get $addr_min)))
        (i32.store (local.get $addr_min) (local.get $temp))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $outer))))
)
