(module
  (memory (export "memory") 1)

  ;; All-pairs shortest paths over a dense n x n i32 distance matrix
  ;; at dist_base (row-major, 999999 meaning "no edge").

  (func $fw_run (export "fw_run") (param $dist_base i32) (param $n i32)
    (local $k i32)
    (local $i i32)
    (local $j i32)
    (local $through_k i32)
    (local $direct i32)
    (local.set $k (i32.const 0))
    (block $k_done
      (loop $k_loop
        (br_if $k_done (i32.ge_s (local.get $k) (local.get $n)))
        (local.set $i (i32.const 0))
        (block $i_done
          (loop $i_loop
            (br_if $i_done (i32.ge_s (local.get $i) (local.get $n)))
            (local.set $j (i32.const 0))
            (block $j_done
              (loop $j_loop
                (br_if $j_done (i32.ge_s (local.get $j) (local.get $n)))
                (local.set $direct
                  (i32.load (i32.add (local.get $dist_base)
                    (i32.mul (i32.add (i32.mul (local.get $i) (local.get $n)) (local.get $j)) (i32.const 4)))))
                (local.set $through_k
                  (i32.add
                    (i32.load (i32.add (local.get $dist_base)
                      (i32.mul (i32.add (i32.mul (local.get $i) (local.get $n)) (local.get $k)) (i32.const 4))))
                    (i32.load (i32.add (local.get $dist_base)
                      (i32.mul (i32.add (i32.mul (local.get $k) (local.get $n)) (local.get $j)) (i32.const 4))))))
                (if (i32.lt_s (local.get $through_k) (local.get $direct))
                  (then
                    (i32.store
                      (i32.add (local.get $dist_base)
                        (i32.mul (i32.add (i32.mul (local.get $i) (local.get $n)) (local.get $j)) (i32.const 4)))
                      (local.get $through_k))))
                (local.set $j (i32.add (local.get $j) (i32.const 1)))
                (br $j_loop)))
            (local.set $i (i32.add (local.get $i) (i32.const 1)))
            (br $i_loop)))
        (local.set $k (i32.add (local.get $k) (i32.const 1)))
        (br $k_loop))))
)
