;; Count contiguous subarrays of i32 values in memory whose sum equals k
(module
  (memory (export "memory") 1)
  (data (i32.const 0) "\01\00\00\00\01\00\00\00\01\00\00\00")

  (func (export "count_subarrays") (param $n i32) (param $k i32) (result i32)
    (local $i i32) (local $j i32) (local $sum i32) (local $count i32)
    (block $outer_done
      (loop $outer
        (br_if $outer_done (i32.ge_u (local.get $i) (local.get $n)))
        (local.set $sum (i32.const 0))
        (local.set $j (local.get $i))
        (block $inner_done
          (loop $inner
            (br_if $inner_done (i32.ge_u (local.get $j) (local.get $n)))
            (local.set $sum
              (i32.add (local.get $sum)
                       (i32.load (i32.mul (local.get $j) (i32.const 4)))))
            (if (i32.eq (local.get $sum) (local.get $k))
              (then (local.set $count (i32.add (local.get $count) (i32.const 1)))))
            (local.set $j (i32.add (local.get $j) (i32.const 1)))
            (br $inner)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $outer)))
    (local.get $count)))
