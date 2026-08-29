(module
  (memory (export "memory") 1)

  (func $edit_distance (export "edit_distance")
        (param $a_base i32) (param $a_len i32) (param $b_base i32) (param $b_len i32) (result i32)
    (local $dp_base i32)
    (local $stride i32)
    (local $i i32)
    (local $j i32)
    (local $cost i32)
    (local $del_cost i32)
    (local $ins_cost i32)
    (local $sub_cost i32)
    (local $min_val i32)
    (local.set $dp_base (i32.const 10000))
    (local.set $stride (i32.add (local.get $b_len) (i32.const 1)))
    (local.set $i (i32.const 0))
    (block $init_i_done
      (loop $init_i
        (br_if $init_i_done (i32.gt_s (local.get $i) (local.get $a_len)))
        (i32.store (i32.add (local.get $dp_base) (i32.mul (i32.mul (local.get $i) (local.get $stride)) (i32.const 4))) (local.get $i))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $init_i)))
    (local.set $j (i32.const 0))
    (block $init_j_done
      (loop $init_j
        (br_if $init_j_done (i32.gt_s (local.get $j) (local.get $b_len)))
        (i32.store (i32.add (local.get $dp_base) (i32.mul (local.get $j) (i32.const 4))) (local.get $j))
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
            (local.set $cost (select (i32.const 0) (i32.const 1)
              (i32.eq
                (i32.load8_u (i32.add (local.get $a_base) (i32.sub (local.get $i) (i32.const 1))))
                (i32.load8_u (i32.add (local.get $b_base) (i32.sub (local.get $j) (i32.const 1)))))))
            (local.set $del_cost (i32.add (i32.load (i32.add (local.get $dp_base) (i32.mul (i32.add (i32.mul (i32.sub (local.get $i) (i32.const 1)) (local.get $stride)) (local.get $j)) (i32.const 4)))) (i32.const 1)))
            (local.set $ins_cost (i32.add (i32.load (i32.add (local.get $dp_base) (i32.mul (i32.add (i32.mul (local.get $i) (local.get $stride)) (i32.sub (local.get $j) (i32.const 1))) (i32.const 4)))) (i32.const 1)))
            (local.set $sub_cost (i32.add (i32.load (i32.add (local.get $dp_base) (i32.mul (i32.add (i32.mul (i32.sub (local.get $i) (i32.const 1)) (local.get $stride)) (i32.sub (local.get $j) (i32.const 1))) (i32.const 4)))) (local.get $cost)))
            (local.set $min_val (select (local.get $del_cost) (local.get $ins_cost) (i32.lt_s (local.get $del_cost) (local.get $ins_cost))))
            (local.set $min_val (select (local.get $min_val) (local.get $sub_cost) (i32.lt_s (local.get $min_val) (local.get $sub_cost))))
            (i32.store (i32.add (local.get $dp_base) (i32.mul (i32.add (i32.mul (local.get $i) (local.get $stride)) (local.get $j)) (i32.const 4))) (local.get $min_val))
            (local.set $j (i32.add (local.get $j) (i32.const 1)))
            (br $inner)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $outer)))
    (i32.load (i32.add (local.get $dp_base) (i32.mul (i32.add (i32.mul (local.get $a_len) (local.get $stride)) (local.get $b_len)) (i32.const 4)))))
)
