(module
  (memory (export "memory") 1)

  (func $lis (export "lis") (param $base i32) (param $len i32) (result i32)
    (local $dp_base i32)
    (local $i i32)
    (local $j i32)
    (local $xi i32)
    (local $xj i32)
    (local $dpi i32)
    (local $dpj i32)
    (local $candidate i32)
    (local $best i32)
    (local.set $dp_base (i32.const 8000))
    (local.set $i (i32.const 0))
    (block $init_done
      (loop $init
        (br_if $init_done (i32.ge_s (local.get $i) (local.get $len)))
        (i32.store (i32.add (local.get $dp_base) (i32.mul (local.get $i) (i32.const 4))) (i32.const 1))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $init)))
    (local.set $i (i32.const 1))
    (block $outer_done
      (loop $outer
        (br_if $outer_done (i32.ge_s (local.get $i) (local.get $len)))
        (local.set $xi (i32.load (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4)))))
        (local.set $j (i32.const 0))
        (block $inner_done
          (loop $inner
            (br_if $inner_done (i32.ge_s (local.get $j) (local.get $i)))
            (local.set $xj (i32.load (i32.add (local.get $base) (i32.mul (local.get $j) (i32.const 4)))))
            (if (i32.lt_s (local.get $xj) (local.get $xi))
              (then
                (local.set $dpj (i32.load (i32.add (local.get $dp_base) (i32.mul (local.get $j) (i32.const 4)))))
                (local.set $dpi (i32.load (i32.add (local.get $dp_base) (i32.mul (local.get $i) (i32.const 4)))))
                (local.set $candidate (i32.add (local.get $dpj) (i32.const 1)))
                (if (i32.gt_s (local.get $candidate) (local.get $dpi))
                  (then
                    (i32.store (i32.add (local.get $dp_base) (i32.mul (local.get $i) (i32.const 4))) (local.get $candidate))))))
            (local.set $j (i32.add (local.get $j) (i32.const 1)))
            (br $inner)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $outer)))
    (local.set $best (i32.const 0))
    (local.set $i (i32.const 0))
    (block $max_done
      (loop $max_loop
        (br_if $max_done (i32.ge_s (local.get $i) (local.get $len)))
        (local.set $dpi (i32.load (i32.add (local.get $dp_base) (i32.mul (local.get $i) (i32.const 4)))))
        (local.set $best (select (local.get $dpi) (local.get $best) (i32.gt_s (local.get $dpi) (local.get $best))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $max_loop)))
    (local.get $best))
)
