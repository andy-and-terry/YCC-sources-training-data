(module
  (memory (export "memory") 1)

  (func $matrix_chain_order (export "matrix_chain_order") (param $p_base i32) (param $n i32) (result i32)
    (local $dp_base i32)
    (local $stride i32)
    (local $i i32)
    (local $j i32)
    (local $k i32)
    (local $chain_len i32)
    (local $cost i32)
    (local $best i32)
    (local $pi i32)
    (local $pk i32)
    (local $pj i32)
    (local.set $dp_base (i32.const 4096))
    (local.set $stride (i32.add (local.get $n) (i32.const 1)))
    (local.set $i (i32.const 1))
    (block $diag_done
      (loop $diag
        (br_if $diag_done (i32.gt_s (local.get $i) (local.get $n)))
        (i32.store
          (i32.add (local.get $dp_base) (i32.mul (i32.add (i32.mul (local.get $i) (local.get $stride)) (local.get $i)) (i32.const 4)))
          (i32.const 0))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $diag)))
    (local.set $chain_len (i32.const 2))
    (block $len_done
      (loop $len_loop
        (br_if $len_done (i32.gt_s (local.get $chain_len) (local.get $n)))
        (local.set $i (i32.const 1))
        (block $i_done
          (loop $i_loop
            (br_if $i_done (i32.gt_s (local.get $i) (i32.sub (i32.add (local.get $n) (i32.const 1)) (local.get $chain_len))))
            (local.set $j (i32.sub (i32.add (local.get $i) (local.get $chain_len)) (i32.const 1)))
            (local.set $best (i32.const 2147483647))
            (local.set $k (local.get $i))
            (block $k_done
              (loop $k_loop
                (br_if $k_done (i32.ge_s (local.get $k) (local.get $j)))
                (local.set $pi (i32.load (i32.add (local.get $p_base) (i32.mul (i32.sub (local.get $i) (i32.const 1)) (i32.const 4)))))
                (local.set $pk (i32.load (i32.add (local.get $p_base) (i32.mul (local.get $k) (i32.const 4)))))
                (local.set $pj (i32.load (i32.add (local.get $p_base) (i32.mul (local.get $j) (i32.const 4)))))
                (local.set $cost
                  (i32.add
                    (i32.add
                      (i32.load (i32.add (local.get $dp_base) (i32.mul (i32.add (i32.mul (local.get $i) (local.get $stride)) (local.get $k)) (i32.const 4))))
                      (i32.load (i32.add (local.get $dp_base) (i32.mul (i32.add (i32.mul (i32.add (local.get $k) (i32.const 1)) (local.get $stride)) (local.get $j)) (i32.const 4)))))
                    (i32.mul (i32.mul (local.get $pi) (local.get $pk)) (local.get $pj))))
                (local.set $best (select (local.get $cost) (local.get $best) (i32.lt_s (local.get $cost) (local.get $best))))
                (local.set $k (i32.add (local.get $k) (i32.const 1)))
                (br $k_loop)))
            (i32.store
              (i32.add (local.get $dp_base) (i32.mul (i32.add (i32.mul (local.get $i) (local.get $stride)) (local.get $j)) (i32.const 4)))
              (local.get $best))
            (local.set $i (i32.add (local.get $i) (i32.const 1)))
            (br $i_loop)))
        (local.set $chain_len (i32.add (local.get $chain_len) (i32.const 1)))
        (br $len_loop)))
    (i32.load (i32.add (local.get $dp_base) (i32.mul (i32.add (i32.mul (i32.const 1) (local.get $stride)) (local.get $n)) (i32.const 4)))))
)
