(module
  (memory (export "memory") 1)

  ;; 1-indexed Fenwick (binary indexed) tree over i32 values stored at
  ;; tree_base; n is the number of logical elements (indices 0..n-1).

  (func $fen_update (export "fen_update") (param $tree_base i32) (param $n i32) (param $pos i32) (param $delta i32)
    (local $i i32)
    (local.set $i (i32.add (local.get $pos) (i32.const 1)))
    (block $done
      (loop $loop
        (br_if $done (i32.gt_s (local.get $i) (local.get $n)))
        (i32.store
          (i32.add (local.get $tree_base) (i32.mul (local.get $i) (i32.const 4)))
          (i32.add
            (i32.load (i32.add (local.get $tree_base) (i32.mul (local.get $i) (i32.const 4))))
            (local.get $delta)))
        (local.set $i (i32.add (local.get $i) (i32.and (local.get $i) (i32.sub (i32.const 0) (local.get $i)))))
        (br $loop))))

  (func $fen_prefix_sum (export "fen_prefix_sum") (param $tree_base i32) (param $pos i32) (result i32)
    (local $i i32)
    (local $sum i32)
    (local.set $i (i32.add (local.get $pos) (i32.const 1)))
    (local.set $sum (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.le_s (local.get $i) (i32.const 0)))
        (local.set $sum
          (i32.add (local.get $sum) (i32.load (i32.add (local.get $tree_base) (i32.mul (local.get $i) (i32.const 4))))))
        (local.set $i (i32.sub (local.get $i) (i32.and (local.get $i) (i32.sub (i32.const 0) (local.get $i)))))
        (br $loop)))
    (local.get $sum))

  (func $fen_range_sum (export "fen_range_sum") (param $tree_base i32) (param $left i32) (param $right i32) (result i32)
    (if (result i32) (i32.eqz (local.get $left))
      (then (call $fen_prefix_sum (local.get $tree_base) (local.get $right)))
      (else
        (i32.sub
          (call $fen_prefix_sum (local.get $tree_base) (local.get $right))
          (call $fen_prefix_sum (local.get $tree_base) (i32.sub (local.get $left) (i32.const 1)))))))
)
