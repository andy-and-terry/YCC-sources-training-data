(module
  (memory (export "memory") 1)

  ;; Recursively 2-colors $node and its neighbors via DFS over an n x n
  ;; adjacency byte matrix. color_base holds one i32 per node (-1 =
  ;; uncolored). Returns 0 the moment two adjacent nodes end up the same
  ;; color (an odd cycle), else 1.
  (func $dfs_color (export "dfs_color")
        (param $node i32) (param $color i32)
        (param $adj_base i32) (param $n i32) (param $color_base i32) (result i32)
    (local $i i32)
    (local $ok i32)
    (i32.store (i32.add (local.get $color_base) (i32.mul (local.get $node) (i32.const 4))) (local.get $color))
    (local.set $ok (i32.const 1))
    (local.set $i (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $i) (local.get $n)))
        (if (i32.load8_u (i32.add (local.get $adj_base) (i32.add (i32.mul (local.get $node) (local.get $n)) (local.get $i))))
          (then
            (if (i32.eq (i32.load (i32.add (local.get $color_base) (i32.mul (local.get $i) (i32.const 4)))) (i32.const -1))
              (then
                (if (i32.eqz (call $dfs_color (local.get $i) (i32.sub (i32.const 1) (local.get $color)) (local.get $adj_base) (local.get $n) (local.get $color_base)))
                  (then (local.set $ok (i32.const 0)))))
              (else
                (if (i32.eq (i32.load (i32.add (local.get $color_base) (i32.mul (local.get $i) (i32.const 4)))) (local.get $color))
                  (then (local.set $ok (i32.const 0))))))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop)))
    (local.get $ok))

  ;; Runs dfs_color from every uncolored node (color_base must start all
  ;; -1). Returns 1 if the whole graph is bipartite, 0 otherwise.
  (func $is_bipartite (export "is_bipartite")
        (param $adj_base i32) (param $n i32) (param $color_base i32) (result i32)
    (local $i i32)
    (local $ok i32)
    (local.set $ok (i32.const 1))
    (local.set $i (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $i) (local.get $n)))
        (if (i32.eq (i32.load (i32.add (local.get $color_base) (i32.mul (local.get $i) (i32.const 4)))) (i32.const -1))
          (then
            (if (i32.eqz (call $dfs_color (local.get $i) (i32.const 0) (local.get $adj_base) (local.get $n) (local.get $color_base)))
              (then (local.set $ok (i32.const 0))))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop)))
    (local.get $ok))
)
