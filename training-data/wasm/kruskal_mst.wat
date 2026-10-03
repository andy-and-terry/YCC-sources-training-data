(module
  (memory (export "memory") 1)

  ;; Kruskal's minimum-spanning-tree algorithm: sorts the (u, v, w)
  ;; edge triples at edges_base in place by weight (insertion sort,
  ;; fine for small edge counts), then adds each edge whose endpoints
  ;; are in different union-find sets, using parent_base as the
  ;; disjoint-set parent array (caller pre-initializes parent[i] = i).

  (func $swap_edges (param $edges_base i32) (param $i i32) (param $j i32)
    (local $k i32)
    (local $tmp i32)
    (local.set $k (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $k) (i32.const 3)))
        (local.set $tmp (i32.load (i32.add (local.get $edges_base) (i32.add (i32.mul (local.get $i) (i32.const 12)) (i32.mul (local.get $k) (i32.const 4))))))
        (i32.store
          (i32.add (local.get $edges_base) (i32.add (i32.mul (local.get $i) (i32.const 12)) (i32.mul (local.get $k) (i32.const 4))))
          (i32.load (i32.add (local.get $edges_base) (i32.add (i32.mul (local.get $j) (i32.const 12)) (i32.mul (local.get $k) (i32.const 4))))))
        (i32.store (i32.add (local.get $edges_base) (i32.add (i32.mul (local.get $j) (i32.const 12)) (i32.mul (local.get $k) (i32.const 4)))) (local.get $tmp))
        (local.set $k (i32.add (local.get $k) (i32.const 1)))
        (br $loop))))

  (func $edge_weight (param $edges_base i32) (param $i i32) (result i32)
    (i32.load (i32.add (local.get $edges_base) (i32.add (i32.mul (local.get $i) (i32.const 12)) (i32.const 8)))))

  (func $sort_edges (param $edges_base i32) (param $num_edges i32)
    (local $i i32)
    (local $j i32)
    (local.set $i (i32.const 1))
    (block $outer_done
      (loop $outer
        (br_if $outer_done (i32.ge_s (local.get $i) (local.get $num_edges)))
        (local.set $j (local.get $i))
        (block $inner_done
          (loop $inner
            (br_if $inner_done (i32.le_s (local.get $j) (i32.const 0)))
            (br_if $inner_done (i32.ge_s (call $edge_weight (local.get $edges_base) (i32.sub (local.get $j) (i32.const 1))) (call $edge_weight (local.get $edges_base) (local.get $j))))
            (call $swap_edges (local.get $edges_base) (i32.sub (local.get $j) (i32.const 1)) (local.get $j))
            (local.set $j (i32.sub (local.get $j) (i32.const 1)))
            (br $inner)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $outer))))

  (func $uf_find (param $parent_base i32) (param $x i32) (result i32)
    (local $p i32)
    (local.set $p (i32.load (i32.add (local.get $parent_base) (i32.mul (local.get $x) (i32.const 4)))))
    (if (result i32) (i32.eq (local.get $p) (local.get $x))
      (then (local.get $x))
      (else (call $uf_find (local.get $parent_base) (local.get $p)))))

  (func $kruskal_mst (export "kruskal_mst") (param $edges_base i32) (param $num_edges i32) (param $parent_base i32) (result i32)
    (local $e i32)
    (local $u i32)
    (local $v i32)
    (local $w i32)
    (local $root_u i32)
    (local $root_v i32)
    (local $total i32)
    (call $sort_edges (local.get $edges_base) (local.get $num_edges))

    (local.set $total (i32.const 0))
    (local.set $e (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $e) (local.get $num_edges)))
        (local.set $u (i32.load (i32.add (local.get $edges_base) (i32.mul (local.get $e) (i32.const 12)))))
        (local.set $v (i32.load (i32.add (local.get $edges_base) (i32.add (i32.mul (local.get $e) (i32.const 12)) (i32.const 4)))))
        (local.set $w (call $edge_weight (local.get $edges_base) (local.get $e)))
        (local.set $root_u (call $uf_find (local.get $parent_base) (local.get $u)))
        (local.set $root_v (call $uf_find (local.get $parent_base) (local.get $v)))
        (if (i32.ne (local.get $root_u) (local.get $root_v))
          (then
            (i32.store (i32.add (local.get $parent_base) (i32.mul (local.get $root_u) (i32.const 4))) (local.get $root_v))
            (local.set $total (i32.add (local.get $total) (local.get $w)))))
        (local.set $e (i32.add (local.get $e) (i32.const 1)))
        (br $loop)))
    (local.get $total))
)
