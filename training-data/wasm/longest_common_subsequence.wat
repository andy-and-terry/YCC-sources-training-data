(module
  (memory (export "memory") 1)

  (func $lcs_length (export "lcs_length")
        (param $a_base i32) (param $a_len i32) (param $b_base i32) (param $b_len i32) (result i32)
    (local $dp_base i32)
    (local $stride i32)
    (local $i i32)
    (local $j i32)
    (local $match i32)
    (local $diag i32)
    (local $up i32)
    (local $left i32)
    (local $best i32)
    (local.set $dp_base (i32.const 10000))
    (local.set $stride (i32.add (local.get $b_len) (i32.const 1)))
    (local.set $i (i32.const 0))
    (block $init_i_done
      (loop $init_i
        (br_if $init_i_done (i32.gt_s (local.get $i) (local.get $a_len)))
        (i32.store (i32.add (local.get $dp_base) (i32.mul (i32.mul (local.get $i) (local.get $stride)) (i32.const 4))) (i32.const 0))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $init_i)))
    (local.set $j (i32.const 0))
    (block $init_j_done
      (loop $init_j
        (br_if $init_j_done (i32.gt_s (local.get $j) (local.get $b_len)))
        (i32.store (i32.add (local.get $dp_base) (i32.mul (local.get $j) (i32.const 4))) (i32.const 0))
        (local.set $j (i32.add (local.get $j) (i32.const 1)))
        (br $init_j)))
    (local.set $i (i32.const 1))
    (block $outer_done
      (loop $outer
        (br_if $outer_done (i32.gt_s (local.get $i) (local.get $a_len)))
        (local.set $j (i32.const 1))
        (block $inner_done
          (loop $inner
            (br_if $inner_done (i32.gt_s (local.get $j) (local.get $b_len)))
            (local.set $match
              (i32.eq
                (i32.load8_u (i32.add (local.get $a_base) (i32.sub (local.get $i) (i32.const 1))))
                (i32.load8_u (i32.add (local.get $b_base) (i32.sub (local.get $j) (i32.const 1))))))
            (if (local.get $match)
              (then
                (local.set $diag (i32.load (i32.add (local.get $dp_base) (i32.mul (i32.add (i32.mul (i32.sub (local.get $i) (i32.const 1)) (local.get $stride)) (i32.sub (local.get $j) (i32.const 1))) (i32.const 4)))))
                (local.set $best (i32.add (local.get $diag) (i32.const 1))))
              (else
                (local.set $up (i32.load (i32.add (local.get $dp_base) (i32.mul (i32.add (i32.mul (i32.sub (local.get $i) (i32.const 1)) (local.get $stride)) (local.get $j)) (i32.const 4)))))
                (local.set $left (i32.load (i32.add (local.get $dp_base) (i32.mul (i32.add (i32.mul (local.get $i) (local.get $stride)) (i32.sub (local.get $j) (i32.const 1))) (i32.const 4)))))
                (local.set $best (select (local.get $up) (local.get $left) (i32.gt_s (local.get $up) (local.get $left))))))
            (i32.store (i32.add (local.get $dp_base) (i32.mul (i32.add (i32.mul (local.get $i) (local.get $stride)) (local.get $j)) (i32.const 4))) (local.get $best))
            (local.set $j (i32.add (local.get $j) (i32.const 1)))
            (br $inner)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $outer)))
    (i32.load (i32.add (local.get $dp_base) (i32.mul (i32.add (i32.mul (local.get $a_len) (local.get $stride)) (local.get $b_len)) (i32.const 4)))))
)
