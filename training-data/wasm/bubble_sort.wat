(module
  (memory (export "memory") 1)

  (func $bubble_sort (export "bubble_sort") (param $base i32) (param $len i32)
    (local $i i32)
    (local $j i32)
    (local $a i32)
    (local $b i32)
    (local $temp i32)
    (local.set $i (i32.const 0))
    (block $outer_done
      (loop $outer
        (br_if $outer_done (i32.ge_s (local.get $i) (local.get $len)))
        (local.set $j (i32.const 0))
        (block $inner_done
          (loop $inner
            (br_if $inner_done (i32.ge_s (local.get $j) (i32.sub (i32.sub (local.get $len) (local.get $i)) (i32.const 1))))
            (local.set $a (i32.load (i32.add (local.get $base) (i32.mul (local.get $j) (i32.const 4)))))
            (local.set $b (i32.load (i32.add (local.get $base) (i32.mul (i32.add (local.get $j) (i32.const 1)) (i32.const 4)))))
            (if (i32.gt_s (local.get $a) (local.get $b))
              (then
                (i32.store (i32.add (local.get $base) (i32.mul (local.get $j) (i32.const 4))) (local.get $b))
                (i32.store (i32.add (local.get $base) (i32.mul (i32.add (local.get $j) (i32.const 1)) (i32.const 4))) (local.get $a))))
            (local.set $j (i32.add (local.get $j) (i32.const 1)))
            (br $inner)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $outer))))
)
