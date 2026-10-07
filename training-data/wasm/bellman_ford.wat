(module
  (memory (export "memory") 1)

  ;; Single-source shortest paths tolerant of negative edge weights.
  ;; edges_base holds num_edges triples of (u, v, w) as consecutive
  ;; i32 values; dist_base holds n i32 distances, initialized by the
  ;; caller to 999999 except dist[src] = 0.

  (func $bf_relax_once (export "bf_relax_once") (param $edges_base i32) (param $num_edges i32) (param $dist_base i32) (result i32)
    (local $e i32)
    (local $u i32)
    (local $v i32)
    (local $w i32)
    (local $du i32)
    (local $dv i32)
    (local $changed i32)
    (local.set $e (i32.const 0))
    (local.set $changed (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $e) (local.get $num_edges)))
        (local.set $u (i32.load (i32.add (local.get $edges_base) (i32.mul (local.get $e) (i32.const 12)))))
        (local.set $v (i32.load (i32.add (local.get $edges_base) (i32.add (i32.mul (local.get $e) (i32.const 12)) (i32.const 4)))))
        (local.set $w (i32.load (i32.add (local.get $edges_base) (i32.add (i32.mul (local.get $e) (i32.const 12)) (i32.const 8)))))
        (local.set $du (i32.load (i32.add (local.get $dist_base) (i32.mul (local.get $u) (i32.const 4)))))
        (local.set $dv (i32.load (i32.add (local.get $dist_base) (i32.mul (local.get $v) (i32.const 4)))))
        (if (i32.lt_s (i32.add (local.get $du) (local.get $w)) (local.get $dv))
          (then
            (i32.store (i32.add (local.get $dist_base) (i32.mul (local.get $v) (i32.const 4))) (i32.add (local.get $du) (local.get $w)))
            (local.set $changed (i32.const 1))))
        (local.set $e (i32.add (local.get $e) (i32.const 1)))
        (br $loop)))
    (local.get $changed))

  ;; Runs n-1 relaxation passes; a 1 return from the final pass would
  ;; mean a negative-weight cycle reachable from src.
  (func $bf_run (export "bf_run") (param $edges_base i32) (param $num_edges i32) (param $dist_base i32) (param $n i32) (result i32)
    (local $i i32)
    (local $still_changing i32)
    (local.set $i (i32.const 0))
    (local.set $still_changing (i32.const 1))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $i) (i32.sub (local.get $n) (i32.const 1))))
        (local.set $still_changing (call $bf_relax_once (local.get $edges_base) (local.get $num_edges) (local.get $dist_base)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop)))
    (call $bf_relax_once (local.get $edges_base) (local.get $num_edges) (local.get $dist_base)))
)
