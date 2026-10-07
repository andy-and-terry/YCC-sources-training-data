(module
  (memory (export "memory") 1)

  ;; Checks whether an undirected graph (n x n byte 0/1 adjacency
  ;; matrix at graph_base) is bipartite, via BFS 2-coloring using an
  ;; explicit queue array at queue_base and a color array at
  ;; color_base (0 = uncolored, 1/2 = the two colors).

  (func $bfs_color (param $graph_base i32) (param $color_base i32) (param $queue_base i32) (param $n i32) (param $start i32) (result i32)
    (local $head i32)
    (local $tail i32)
    (local $u i32)
    (local $v i32)
    (local $ok i32)
    (i32.store8 (i32.add (local.get $color_base) (local.get $start)) (i32.const 1))
    (i32.store (local.get $queue_base) (local.get $start))
    (local.set $head (i32.const 0))
    (local.set $tail (i32.const 1))
    (local.set $ok (i32.const 1))

    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $head) (local.get $tail)))
        (local.set $u (i32.load (i32.add (local.get $queue_base) (i32.mul (local.get $head) (i32.const 4)))))
        (local.set $head (i32.add (local.get $head) (i32.const 1)))
        (local.set $v (i32.const 0))
        (block $inner_done
          (loop $inner
            (br_if $inner_done (i32.ge_s (local.get $v) (local.get $n)))
            (if (i32.load8_u (i32.add (local.get $graph_base) (i32.mul (i32.add (i32.mul (local.get $u) (local.get $n)) (local.get $v)) (i32.const 1))))
              (then
                (if (i32.eqz (i32.load8_u (i32.add (local.get $color_base) (local.get $v))))
                  (then
                    (i32.store8
                      (i32.add (local.get $color_base) (local.get $v))
                      (i32.sub (i32.const 3) (i32.load8_u (i32.add (local.get $color_base) (local.get $u)))))
                    (i32.store (i32.add (local.get $queue_base) (i32.mul (local.get $tail) (i32.const 4))) (local.get $v))
                    (local.set $tail (i32.add (local.get $tail) (i32.const 1))))
                  (else
                    (if (i32.eq (i32.load8_u (i32.add (local.get $color_base) (local.get $v))) (i32.load8_u (i32.add (local.get $color_base) (local.get $u))))
                      (then (local.set $ok (i32.const 0))))))))
            (local.set $v (i32.add (local.get $v) (i32.const 1)))
            (br $inner)))
        (br $loop)))
    (local.get $ok))

  (func $is_bipartite (export "is_bipartite") (param $graph_base i32) (param $color_base i32) (param $queue_base i32) (param $n i32) (result i32)
    (local $u i32)
    (local $ok i32)
    (local.set $u (i32.const 0))
    (block $clear_done
      (loop $clear
        (br_if $clear_done (i32.ge_s (local.get $u) (local.get $n)))
        (i32.store8 (i32.add (local.get $color_base) (local.get $u)) (i32.const 0))
        (local.set $u (i32.add (local.get $u) (i32.const 1)))
        (br $clear)))

    (local.set $ok (i32.const 1))
    (local.set $u (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $u) (local.get $n)))
        (if (i32.eqz (i32.load8_u (i32.add (local.get $color_base) (local.get $u))))
          (then
            (if (i32.eqz (call $bfs_color (local.get $graph_base) (local.get $color_base) (local.get $queue_base) (local.get $n) (local.get $u)))
              (then (local.set $ok (i32.const 0))))))
        (local.set $u (i32.add (local.get $u) (i32.const 1)))
        (br $loop)))
    (local.get $ok))
)
