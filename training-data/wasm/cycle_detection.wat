(module
  (memory (export "memory") 1)

  ;; Directed-cycle detection via DFS. adj_base is an n x n byte matrix
  ;; (1 = edge i->j). visited_base/on_stack_base are n-byte scratch arrays
  ;; the caller zero-initializes. Returns 1 if a back edge (a cycle) is
  ;; found reachable from $node, else 0.
  (func $dfs_has_cycle (export "dfs_has_cycle")
        (param $node i32) (param $adj_base i32) (param $n i32)
        (param $visited_base i32) (param $on_stack_base i32) (result i32)
    (local $i i32)
    (local $result i32)
    (i32.store8 (i32.add (local.get $visited_base) (local.get $node)) (i32.const 1))
    (i32.store8 (i32.add (local.get $on_stack_base) (local.get $node)) (i32.const 1))
    (local.set $result (i32.const 0))
    (local.set $i (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $i) (local.get $n)))
        (if (i32.load8_u (i32.add (local.get $adj_base) (i32.add (i32.mul (local.get $node) (local.get $n)) (local.get $i))))
          (then
            (if (i32.eqz (i32.load8_u (i32.add (local.get $visited_base) (local.get $i))))
              (then
                (if (call $dfs_has_cycle (local.get $i) (local.get $adj_base) (local.get $n) (local.get $visited_base) (local.get $on_stack_base))
                  (then (local.set $result (i32.const 1)))))
              (else
                (if (i32.load8_u (i32.add (local.get $on_stack_base) (local.get $i)))
                  (then (local.set $result (i32.const 1))))))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop)))
    (i32.store8 (i32.add (local.get $on_stack_base) (local.get $node)) (i32.const 0))
    (local.get $result))

  ;; Runs dfs_has_cycle from every unvisited node; returns 1 if any cycle
  ;; exists anywhere in the graph.
  (func $has_cycle (export "has_cycle")
        (param $adj_base i32) (param $n i32) (param $visited_base i32) (param $on_stack_base i32) (result i32)
    (local $i i32)
    (local $result i32)
    (local.set $result (i32.const 0))
    (local.set $i (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $i) (local.get $n)))
        (if (i32.eqz (i32.load8_u (i32.add (local.get $visited_base) (local.get $i))))
          (then
            (if (call $dfs_has_cycle (local.get $i) (local.get $adj_base) (local.get $n) (local.get $visited_base) (local.get $on_stack_base))
              (then (local.set $result (i32.const 1))))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop)))
    (local.get $result))
)
