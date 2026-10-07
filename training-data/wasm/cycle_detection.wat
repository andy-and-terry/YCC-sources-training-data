(module
  (memory (export "memory") 1)

  ;; Detects a cycle in a directed graph given as an n x n 0/1
  ;; adjacency matrix, via DFS with a 3-color scheme at color_base
  ;; (0 = white/unvisited, 1 = gray/in-progress, 2 = black/done).

  (func $dfs_has_cycle (export "dfs_has_cycle") (param $graph_base i32) (param $color_base i32) (param $n i32) (param $u i32) (result i32)
    (local $v i32)
    (local $color_v i32)
    (local $found i32)
    (i32.store (i32.add (local.get $color_base) (local.get $u)) (i32.const 1))

    (local.set $found (i32.const 0))
    (local.set $v (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $v) (local.get $n)))
        (if (i32.load8_u (i32.add (local.get $graph_base) (i32.mul (i32.add (i32.mul (local.get $u) (local.get $n)) (local.get $v)) (i32.const 1))))
          (then
            (local.set $color_v (i32.load8_u (i32.add (local.get $color_base) (local.get $v))))
            (if (i32.eq (local.get $color_v) (i32.const 1))
              (then (local.set $found (i32.const 1)))
              (else
                (if (i32.eqz (local.get $color_v))
                  (then
                    (if (call $dfs_has_cycle (local.get $graph_base) (local.get $color_base) (local.get $n) (local.get $v))
                      (then (local.set $found (i32.const 1))))))))))
        (local.set $v (i32.add (local.get $v) (i32.const 1)))
        (br $loop)))

    (i32.store8 (i32.add (local.get $color_base) (local.get $u)) (i32.const 2))
    (local.get $found))

  (func $has_cycle (export "has_cycle") (param $graph_base i32) (param $color_base i32) (param $n i32) (result i32)
    (local $u i32)
    (local $found i32)
    (local.set $u (i32.const 0))
    (block $clear_done
      (loop $clear
        (br_if $clear_done (i32.ge_s (local.get $u) (local.get $n)))
        (i32.store8 (i32.add (local.get $color_base) (local.get $u)) (i32.const 0))
        (local.set $u (i32.add (local.get $u) (i32.const 1)))
        (br $clear)))

    (local.set $found (i32.const 0))
    (local.set $u (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $u) (local.get $n)))
        (if (i32.eqz (i32.load8_u (i32.add (local.get $color_base) (local.get $u))))
          (then
            (if (call $dfs_has_cycle (local.get $graph_base) (local.get $color_base) (local.get $n) (local.get $u))
              (then (local.set $found (i32.const 1))))))
        (local.set $u (i32.add (local.get $u) (i32.const 1)))
        (br $loop)))
    (local.get $found))
)
