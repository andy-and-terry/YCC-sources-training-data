(module
  (memory (export "memory") 1)

  (func $find_min_unvisited (export "find_min_unvisited")
        (param $dist_base i32) (param $visited_base i32) (param $n i32) (result i32)
    (local $i i32)
    (local $best_node i32)
    (local $best_dist i32)
    (local $d i32)
    (local.set $best_node (i32.const -1))
    (local.set $best_dist (i32.const 999999))
    (local.set $i (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $i) (local.get $n)))
        (if (i32.eqz (i32.load8_u (i32.add (local.get $visited_base) (local.get $i))))
          (then
            (local.set $d (i32.load (i32.add (local.get $dist_base) (i32.mul (local.get $i) (i32.const 4)))))
            (if (i32.lt_s (local.get $d) (local.get $best_dist))
              (then
                (local.set $best_dist (local.get $d))
                (local.set $best_node (local.get $i))))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop)))
    (local.get $best_node))
)
