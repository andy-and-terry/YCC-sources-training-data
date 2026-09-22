(module
  (memory (export "memory") 1)

  ;; Binary indexed tree (Fenwick tree), 1-indexed: base[1..n] must start
  ;; zeroed. Adds delta at index and propagates to the ancestors that cover
  ;; it, walking up via index += index & -index.
  (func $fenwick_update (export "fenwick_update") (param $base i32) (param $n i32) (param $index i32) (param $delta i32)
    (local $i i32)
    (local $lowbit i32)
    (local.set $i (local.get $index))
    (block $done
      (loop $loop
        (br_if $done (i32.gt_s (local.get $i) (local.get $n)))
        (i32.store (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4)))
          (i32.add (i32.load (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4)))) (local.get $delta)))
        (local.set $lowbit (i32.and (local.get $i) (i32.sub (i32.const 0) (local.get $i))))
        (local.set $i (i32.add (local.get $i) (local.get $lowbit)))
        (br $loop))))

  ;; Sum of base[1..index], walking down via index -= index & -index.
  (func $fenwick_prefix_sum (export "fenwick_prefix_sum") (param $base i32) (param $index i32) (result i32)
    (local $i i32)
    (local $sum i32)
    (local $lowbit i32)
    (local.set $i (local.get $index))
    (local.set $sum (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.le_s (local.get $i) (i32.const 0)))
        (local.set $sum (i32.add (local.get $sum) (i32.load (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4))))))
        (local.set $lowbit (i32.and (local.get $i) (i32.sub (i32.const 0) (local.get $i))))
        (local.set $i (i32.sub (local.get $i) (local.get $lowbit)))
        (br $loop)))
    (local.get $sum))

  (func $fenwick_range_sum (export "fenwick_range_sum") (param $base i32) (param $l i32) (param $r i32) (result i32)
    (i32.sub (call $fenwick_prefix_sum (local.get $base) (local.get $r))
             (call $fenwick_prefix_sum (local.get $base) (i32.sub (local.get $l) (i32.const 1)))))
)
