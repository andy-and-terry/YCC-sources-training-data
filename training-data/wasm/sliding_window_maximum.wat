(module
  (memory (export "memory") 1)

  ;; Writes the max of each contiguous window of size $k over the $len i32s
  ;; at $base into $out_base (len - k + 1 results).
  (func $sliding_window_max (export "sliding_window_max") (param $base i32) (param $len i32) (param $k i32) (param $out_base i32)
    (local $i i32)
    (local $j i32)
    (local $cur i32)
    (local $best i32)
    (local.set $i (i32.const 0))
    (block $outer_done
      (loop $outer
        (br_if $outer_done (i32.gt_s (i32.add (local.get $i) (local.get $k)) (local.get $len)))
        (local.set $best (i32.load (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4)))))
        (local.set $j (i32.const 1))
        (block $inner_done
          (loop $inner
            (br_if $inner_done (i32.ge_s (local.get $j) (local.get $k)))
            (local.set $cur (i32.load (i32.add (local.get $base) (i32.mul (i32.add (local.get $i) (local.get $j)) (i32.const 4)))))
            (local.set $best (select (local.get $cur) (local.get $best) (i32.gt_s (local.get $cur) (local.get $best))))
            (local.set $j (i32.add (local.get $j) (i32.const 1)))
            (br $inner)))
        (i32.store (i32.add (local.get $out_base) (i32.mul (local.get $i) (i32.const 4))) (local.get $best))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $outer))))
)
