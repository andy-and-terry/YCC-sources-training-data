(module
  (memory (export "memory") 1)

  (func $min_coins (export "min_coins") (param $coins_base i32) (param $num_coins i32) (param $amount i32) (result i32)
    (local $dp_base i32)
    (local $n i32)
    (local $c_idx i32)
    (local $coin i32)
    (local $current i32)
    (local $candidate i32)
    (local.set $dp_base (i32.const 9000))
    (i32.store (local.get $dp_base) (i32.const 0))
    (local.set $n (i32.const 1))
    (block $outer_done
      (loop $outer
        (br_if $outer_done (i32.gt_s (local.get $n) (local.get $amount)))
        (i32.store (i32.add (local.get $dp_base) (i32.mul (local.get $n) (i32.const 4))) (i32.const -1))
        (local.set $c_idx (i32.const 0))
        (block $inner_done
          (loop $inner
            (br_if $inner_done (i32.ge_s (local.get $c_idx) (local.get $num_coins)))
            (local.set $coin (i32.load (i32.add (local.get $coins_base) (i32.mul (local.get $c_idx) (i32.const 4)))))
            (if (i32.le_s (local.get $coin) (local.get $n))
              (then
                (local.set $current (i32.load (i32.add (local.get $dp_base) (i32.mul (i32.sub (local.get $n) (local.get $coin)) (i32.const 4)))))
                (if (i32.ne (local.get $current) (i32.const -1))
                  (then
                    (local.set $candidate (i32.add (local.get $current) (i32.const 1)))
                    (if (i32.or
                          (i32.eq (i32.load (i32.add (local.get $dp_base) (i32.mul (local.get $n) (i32.const 4)))) (i32.const -1))
                          (i32.lt_s (local.get $candidate) (i32.load (i32.add (local.get $dp_base) (i32.mul (local.get $n) (i32.const 4))))))
                      (then (i32.store (i32.add (local.get $dp_base) (i32.mul (local.get $n) (i32.const 4))) (local.get $candidate))))))))
            (local.set $c_idx (i32.add (local.get $c_idx) (i32.const 1)))
            (br $inner)))
        (local.set $n (i32.add (local.get $n) (i32.const 1)))
        (br $outer)))
    (i32.load (i32.add (local.get $dp_base) (i32.mul (local.get $amount) (i32.const 4)))))
)
