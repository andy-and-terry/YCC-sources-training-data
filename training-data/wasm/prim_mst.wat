(module
  (memory (export "memory") 1)

  ;; Prim's minimum-spanning-tree algorithm over a dense n x n i32
  ;; adjacency matrix at graph_base (0 meaning "no edge"); scratch_base
  ;; must point to 2*n*4 free bytes for the key[] and in_mst[] arrays.

  (func $prim_mst (export "prim_mst") (param $graph_base i32) (param $scratch_base i32) (param $n i32) (result i32)
    (local $key_base i32)
    (local $in_mst_base i32)
    (local $i i32)
    (local $u i32)
    (local $v i32)
    (local $best i32)
    (local $best_val i32)
    (local $w i32)
    (local $total i32)
    (local.set $key_base (local.get $scratch_base))
    (local.set $in_mst_base (i32.add (local.get $scratch_base) (i32.mul (local.get $n) (i32.const 4))))

    (local.set $i (i32.const 0))
    (block $init_done
      (loop $init
        (br_if $init_done (i32.ge_s (local.get $i) (local.get $n)))
        (i32.store (i32.add (local.get $key_base) (i32.mul (local.get $i) (i32.const 4))) (i32.const 999999))
        (i32.store (i32.add (local.get $in_mst_base) (i32.mul (local.get $i) (i32.const 4))) (i32.const 0))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $init)))
    (i32.store (local.get $key_base) (i32.const 0))

    (local.set $total (i32.const 0))
    (local.set $i (i32.const 0))
    (block $outer_done
      (loop $outer
        (br_if $outer_done (i32.ge_s (local.get $i) (local.get $n)))

        (local.set $best (i32.const -1))
        (local.set $best_val (i32.const 1000000))
        (local.set $u (i32.const 0))
        (block $pick_done
          (loop $pick
            (br_if $pick_done (i32.ge_s (local.get $u) (local.get $n)))
            (if (i32.and
                  (i32.eqz (i32.load (i32.add (local.get $in_mst_base) (i32.mul (local.get $u) (i32.const 4)))))
                  (i32.lt_s
                    (i32.load (i32.add (local.get $key_base) (i32.mul (local.get $u) (i32.const 4))))
                    (local.get $best_val)))
              (then
                (local.set $best (local.get $u))
                (local.set $best_val (i32.load (i32.add (local.get $key_base) (i32.mul (local.get $u) (i32.const 4)))))))
            (local.set $u (i32.add (local.get $u) (i32.const 1)))
            (br $pick)))

        (i32.store (i32.add (local.get $in_mst_base) (i32.mul (local.get $best) (i32.const 4))) (i32.const 1))
        (local.set $total (i32.add (local.get $total) (local.get $best_val)))

        (local.set $v (i32.const 0))
        (block $relax_done
          (loop $relax
            (br_if $relax_done (i32.ge_s (local.get $v) (local.get $n)))
            (local.set $w
              (i32.load (i32.add (local.get $graph_base)
                (i32.mul (i32.add (i32.mul (local.get $best) (local.get $n)) (local.get $v)) (i32.const 4)))))
            (if (i32.and
                  (i32.gt_s (local.get $w) (i32.const 0))
                  (i32.and
                    (i32.eqz (i32.load (i32.add (local.get $in_mst_base) (i32.mul (local.get $v) (i32.const 4)))))
                    (i32.lt_s (local.get $w) (i32.load (i32.add (local.get $key_base) (i32.mul (local.get $v) (i32.const 4)))))))
              (then
                (i32.store (i32.add (local.get $key_base) (i32.mul (local.get $v) (i32.const 4))) (local.get $w))))
            (local.set $v (i32.add (local.get $v) (i32.const 1)))
            (br $relax)))

        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $outer)))
    (local.get $total))
)
