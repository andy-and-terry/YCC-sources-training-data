(module
  (memory (export "memory") 1)

  (func $matrix_multiply_2x2 (export "matrix_multiply_2x2")
        (param $a_base i32) (param $b_base i32) (param $result_base i32)
    (local $i i32)
    (local $j i32)
    (local $k i32)
    (local $sum i32)
    (local.set $i (i32.const 0))
    (block $outer_done
      (loop $outer
        (br_if $outer_done (i32.ge_s (local.get $i) (i32.const 2)))
        (local.set $j (i32.const 0))
        (block $mid_done
          (loop $mid
            (br_if $mid_done (i32.ge_s (local.get $j) (i32.const 2)))
            (local.set $sum (i32.const 0))
            (local.set $k (i32.const 0))
            (block $inner_done
              (loop $inner
                (br_if $inner_done (i32.ge_s (local.get $k) (i32.const 2)))
                (local.set $sum (i32.add (local.get $sum)
                  (i32.mul
                    (i32.load (i32.add (local.get $a_base) (i32.mul (i32.add (i32.mul (local.get $i) (i32.const 2)) (local.get $k)) (i32.const 4))))
                    (i32.load (i32.add (local.get $b_base) (i32.mul (i32.add (i32.mul (local.get $k) (i32.const 2)) (local.get $j)) (i32.const 4)))))))
                (local.set $k (i32.add (local.get $k) (i32.const 1)))
                (br $inner)))
            (i32.store (i32.add (local.get $result_base) (i32.mul (i32.add (i32.mul (local.get $i) (i32.const 2)) (local.get $j)) (i32.const 4))) (local.get $sum))
            (local.set $j (i32.add (local.get $j) (i32.const 1)))
            (br $mid)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $outer))))
)
