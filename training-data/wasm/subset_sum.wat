(module
  (memory (export "memory") 1)

  ;; Returns 1 if some subset of the n i32s at $base sums exactly to $target, else 0.
  (func $subset_sum (export "subset_sum") (param $base i32) (param $n i32) (param $target i32) (result i32)
    (local $dp_base i32)
    (local $i i32)
    (local $cap i32)
    (local $num i32)
    (local $val i32)
    (local $prev i32)
    (local.set $dp_base (i32.const 8000))
    (local.set $cap (i32.const 0))
    (block $init_done
      (loop $init
        (br_if $init_done (i32.gt_s (local.get $cap) (local.get $target)))
        (i32.store (i32.add (local.get $dp_base) (i32.mul (local.get $cap) (i32.const 4))) (i32.const 0))
        (local.set $cap (i32.add (local.get $cap) (i32.const 1)))
        (br $init)))
    (i32.store (local.get $dp_base) (i32.const 1))
    (local.set $i (i32.const 0))
    (block $outer_done
      (loop $outer
        (br_if $outer_done (i32.ge_s (local.get $i) (local.get $n)))
        (local.set $num (i32.load (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4)))))
        (local.set $cap (local.get $target))
        (block $inner_done
          (loop $inner
            (br_if $inner_done (i32.lt_s (local.get $cap) (local.get $num)))
            (local.set $val (i32.load (i32.add (local.get $dp_base) (i32.mul (local.get $cap) (i32.const 4)))))
            (if (i32.eqz (local.get $val))
              (then
                (local.set $prev (i32.load (i32.add (local.get $dp_base) (i32.mul (i32.sub (local.get $cap) (local.get $num)) (i32.const 4)))))
                (if (i32.eq (local.get $prev) (i32.const 1))
                  (then
                    (i32.store (i32.add (local.get $dp_base) (i32.mul (local.get $cap) (i32.const 4))) (i32.const 1))))))
            (local.set $cap (i32.sub (local.get $cap) (i32.const 1)))
            (br $inner)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $outer)))
    (i32.load (i32.add (local.get $dp_base) (i32.mul (local.get $target) (i32.const 4)))))
)
