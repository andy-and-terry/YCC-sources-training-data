(module
  (memory (export "memory") 1)

  (func $counting_sort (export "counting_sort")
        (param $base i32) (param $len i32) (param $counts_base i32) (param $max_value i32)
    (local $i i32)
    (local $v i32)
    (local $idx i32)
    (local.set $i (i32.const 0))
    (block $clear_done
      (loop $clear_loop
        (br_if $clear_done (i32.gt_s (local.get $i) (local.get $max_value)))
        (i32.store (i32.add (local.get $counts_base) (i32.mul (local.get $i) (i32.const 4))) (i32.const 0))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $clear_loop)))
    (local.set $i (i32.const 0))
    (block $count_done
      (loop $count_loop
        (br_if $count_done (i32.ge_s (local.get $i) (local.get $len)))
        (local.set $v (i32.load (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4)))))
        (i32.store (i32.add (local.get $counts_base) (i32.mul (local.get $v) (i32.const 4)))
          (i32.add (i32.load (i32.add (local.get $counts_base) (i32.mul (local.get $v) (i32.const 4)))) (i32.const 1)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $count_loop)))
    (local.set $idx (i32.const 0))
    (local.set $v (i32.const 0))
    (block $write_done
      (loop $write_loop
        (br_if $write_done (i32.gt_s (local.get $v) (local.get $max_value)))
        (block $inner_done
          (loop $inner_loop
            (br_if $inner_done (i32.eqz (i32.load (i32.add (local.get $counts_base) (i32.mul (local.get $v) (i32.const 4))))))
            (i32.store (i32.add (local.get $base) (i32.mul (local.get $idx) (i32.const 4))) (local.get $v))
            (local.set $idx (i32.add (local.get $idx) (i32.const 1)))
            (i32.store (i32.add (local.get $counts_base) (i32.mul (local.get $v) (i32.const 4)))
              (i32.sub (i32.load (i32.add (local.get $counts_base) (i32.mul (local.get $v) (i32.const 4)))) (i32.const 1)))
            (br $inner_loop)))
        (local.set $v (i32.add (local.get $v) (i32.const 1)))
        (br $write_loop))))
)
