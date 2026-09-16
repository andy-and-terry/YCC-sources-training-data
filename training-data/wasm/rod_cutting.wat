(module
  (memory (export "memory") 1)

  ;; Classic rod-cutting DP: $price_base holds n prices (price[i-1] = price
  ;; for a piece of length i); returns the max revenue for a rod of length n.
  (func $rod_cutting (export "rod_cutting") (param $price_base i32) (param $n i32) (result i32)
    (local $dp_base i32)
    (local $len i32)
    (local $cut i32)
    (local $val i32)
    (local $best i32)
    (local.set $dp_base (i32.const 8000))
    (i32.store (local.get $dp_base) (i32.const 0))
    (local.set $len (i32.const 1))
    (block $outer_done
      (loop $outer
        (br_if $outer_done (i32.gt_s (local.get $len) (local.get $n)))
        (local.set $best (i32.const 0))
        (local.set $cut (i32.const 1))
        (block $inner_done
          (loop $inner
            (br_if $inner_done (i32.gt_s (local.get $cut) (local.get $len)))
            (local.set $val
              (i32.add
                (i32.load (i32.add (local.get $price_base) (i32.mul (i32.sub (local.get $cut) (i32.const 1)) (i32.const 4))))
                (i32.load (i32.add (local.get $dp_base) (i32.mul (i32.sub (local.get $len) (local.get $cut)) (i32.const 4))))))
            (local.set $best (select (local.get $val) (local.get $best) (i32.gt_s (local.get $val) (local.get $best))))
            (local.set $cut (i32.add (local.get $cut) (i32.const 1)))
            (br $inner)))
        (i32.store (i32.add (local.get $dp_base) (i32.mul (local.get $len) (i32.const 4))) (local.get $best))
        (local.set $len (i32.add (local.get $len) (i32.const 1)))
        (br $outer)))
    (i32.load (i32.add (local.get $dp_base) (i32.mul (local.get $n) (i32.const 4)))))
)
