(module
  (memory (export "memory") 1)

  ;; Bellman-Ford: relax every edge in an n x n weight matrix (graph[i*n+j],
  ;; or 999999 meaning "no edge") for n-1 passes. Tolerates negative edge
  ;; weights, unlike Dijkstra's greedy approach.
  (func $bellman_ford (export "bellman_ford")
        (param $graph_base i32) (param $n i32) (param $dist_base i32) (param $source i32)
    (local $iter i32)
    (local $i i32)
    (local $j i32)
    (local $w i32)
    (local $di i32)
    (local $dj i32)

    (local.set $i (i32.const 0))
    (block $init_done
      (loop $init_loop
        (br_if $init_done (i32.ge_s (local.get $i) (local.get $n)))
        (i32.store (i32.add (local.get $dist_base) (i32.mul (local.get $i) (i32.const 4))) (i32.const 999999))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $init_loop)))
    (i32.store (i32.add (local.get $dist_base) (i32.mul (local.get $source) (i32.const 4))) (i32.const 0))

    (local.set $iter (i32.const 0))
    (block $outer_done
      (loop $outer_loop
        (br_if $outer_done (i32.ge_s (local.get $iter) (i32.sub (local.get $n) (i32.const 1))))
        (local.set $i (i32.const 0))
        (block $i_done
          (loop $i_loop
            (br_if $i_done (i32.ge_s (local.get $i) (local.get $n)))
            (local.set $di (i32.load (i32.add (local.get $dist_base) (i32.mul (local.get $i) (i32.const 4)))))
            (local.set $j (i32.const 0))
            (block $j_done
              (loop $j_loop
                (br_if $j_done (i32.ge_s (local.get $j) (local.get $n)))
                (local.set $w (i32.load (i32.add (local.get $graph_base)
                                (i32.mul (i32.add (i32.mul (local.get $i) (local.get $n)) (local.get $j)) (i32.const 4)))))
                (if (i32.and
                      (i32.ne (local.get $di) (i32.const 999999))
                      (i32.ne (local.get $w) (i32.const 999999)))
                  (then
                    (local.set $dj (i32.load (i32.add (local.get $dist_base) (i32.mul (local.get $j) (i32.const 4)))))
                    (if (i32.lt_s (i32.add (local.get $di) (local.get $w)) (local.get $dj))
                      (then
                        (i32.store (i32.add (local.get $dist_base) (i32.mul (local.get $j) (i32.const 4)))
                                   (i32.add (local.get $di) (local.get $w)))))))
                (local.set $j (i32.add (local.get $j) (i32.const 1)))
                (br $j_loop)))
            (local.set $i (i32.add (local.get $i) (i32.const 1)))
            (br $i_loop)))
        (local.set $iter (i32.add (local.get $iter) (i32.const 1)))
        (br $outer_loop)))
  )
)
