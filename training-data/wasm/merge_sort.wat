(module
  (memory (export "memory") 1)

  (func $merge (export "merge")
        (param $base i32) (param $aux_base i32) (param $low i32) (param $mid i32) (param $high i32)
    (local $i i32)
    (local $j i32)
    (local $k i32)
    (local.set $i (local.get $low))
    (local.set $j (i32.add (local.get $mid) (i32.const 1)))
    (local.set $k (local.get $low))
    (block $merge_done
      (loop $merge_loop
        (br_if $merge_done (i32.or (i32.gt_s (local.get $i) (local.get $mid)) (i32.gt_s (local.get $j) (local.get $high))))
        (if (i32.le_s
              (i32.load (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4))))
              (i32.load (i32.add (local.get $base) (i32.mul (local.get $j) (i32.const 4)))))
          (then
            (i32.store (i32.add (local.get $aux_base) (i32.mul (local.get $k) (i32.const 4)))
              (i32.load (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4)))))
            (local.set $i (i32.add (local.get $i) (i32.const 1))))
          (else
            (i32.store (i32.add (local.get $aux_base) (i32.mul (local.get $k) (i32.const 4)))
              (i32.load (i32.add (local.get $base) (i32.mul (local.get $j) (i32.const 4)))))
            (local.set $j (i32.add (local.get $j) (i32.const 1)))))
        (local.set $k (i32.add (local.get $k) (i32.const 1)))
        (br $merge_loop)))
    (block $left_done
      (loop $left_loop
        (br_if $left_done (i32.gt_s (local.get $i) (local.get $mid)))
        (i32.store (i32.add (local.get $aux_base) (i32.mul (local.get $k) (i32.const 4)))
          (i32.load (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (local.set $k (i32.add (local.get $k) (i32.const 1)))
        (br $left_loop)))
    (block $right_done
      (loop $right_loop
        (br_if $right_done (i32.gt_s (local.get $j) (local.get $high)))
        (i32.store (i32.add (local.get $aux_base) (i32.mul (local.get $k) (i32.const 4)))
          (i32.load (i32.add (local.get $base) (i32.mul (local.get $j) (i32.const 4)))))
        (local.set $j (i32.add (local.get $j) (i32.const 1)))
        (local.set $k (i32.add (local.get $k) (i32.const 1)))
        (br $right_loop)))
    (local.set $k (local.get $low))
    (block $copy_done
      (loop $copy_loop
        (br_if $copy_done (i32.gt_s (local.get $k) (local.get $high)))
        (i32.store (i32.add (local.get $base) (i32.mul (local.get $k) (i32.const 4)))
          (i32.load (i32.add (local.get $aux_base) (i32.mul (local.get $k) (i32.const 4)))))
        (local.set $k (i32.add (local.get $k) (i32.const 1)))
        (br $copy_loop))))

  (func $merge_sort (export "merge_sort")
        (param $base i32) (param $aux_base i32) (param $low i32) (param $high i32)
    (local $mid i32)
    (if (i32.lt_s (local.get $low) (local.get $high))
      (then
        (local.set $mid (i32.div_s (i32.add (local.get $low) (local.get $high)) (i32.const 2)))
        (call $merge_sort (local.get $base) (local.get $aux_base) (local.get $low) (local.get $mid))
        (call $merge_sort (local.get $base) (local.get $aux_base) (i32.add (local.get $mid) (i32.const 1)) (local.get $high))
        (call $merge (local.get $base) (local.get $aux_base) (local.get $low) (local.get $mid) (local.get $high)))))
)
