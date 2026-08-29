(module
  (memory (export "memory") 1)

  (func $knapsack (export "knapsack") (param $weights_base i32) (param $values_base i32) (param $n i32) (param $capacity i32) (result i32)
    (local $dp_base i32)
    (local $i i32)
    (local $cap i32)
    (local $w i32)
    (local $v i32)
    (local $with_item i32)
    (local $without i32)
    (local.set $dp_base (i32.const 8000))
    (local.set $cap (i32.const 0))
    (block $init_done
      (loop $init
        (br_if $init_done (i32.gt_s (local.get $cap) (local.get $capacity)))
        (i32.store (i32.add (local.get $dp_base) (i32.mul (local.get $cap) (i32.const 4))) (i32.const 0))
        (local.set $cap (i32.add (local.get $cap) (i32.const 1)))
        (br $init)))
    (local.set $i (i32.const 0))
    (block $outer_done
      (loop $outer
        (br_if $outer_done (i32.ge_s (local.get $i) (local.get $n)))
        (local.set $w (i32.load (i32.add (local.get $weights_base) (i32.mul (local.get $i) (i32.const 4)))))
        (local.set $v (i32.load (i32.add (local.get $values_base) (i32.mul (local.get $i) (i32.const 4)))))
        (local.set $cap (local.get $capacity))
        (block $inner_done
          (loop $inner
            (br_if $inner_done (i32.lt_s (local.get $cap) (local.get $w)))
            (local.set $without (i32.load (i32.add (local.get $dp_base) (i32.mul (local.get $cap) (i32.const 4)))))
            (local.set $with_item (i32.add (i32.load (i32.add (local.get $dp_base) (i32.mul (i32.sub (local.get $cap) (local.get $w)) (i32.const 4)))) (local.get $v)))
            (i32.store (i32.add (local.get $dp_base) (i32.mul (local.get $cap) (i32.const 4)))
              (select (local.get $with_item) (local.get $without) (i32.gt_s (local.get $with_item) (local.get $without))))
            (local.set $cap (i32.sub (local.get $cap) (i32.const 1)))
            (br $inner)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $outer)))
    (i32.load (i32.add (local.get $dp_base) (i32.mul (local.get $capacity) (i32.const 4)))))
)
