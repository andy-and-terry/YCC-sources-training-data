(module
  (memory (export "memory") 1)

  ;; Fills dp_base[0..n] with Catalan numbers via the DP recurrence
  ;; C(0) = 1, C(k) = sum_{i=0}^{k-1} C(i) * C(k-1-i), and returns C(n).

  (func $catalan (export "catalan") (param $dp_base i32) (param $n i32) (result i32)
    (local $k i32)
    (local $i i32)
    (local $sum i32)
    (local $ci i32)
    (local $cj i32)
    (i32.store (local.get $dp_base) (i32.const 1))

    (local.set $k (i32.const 1))
    (block $k_done
      (loop $k_loop
        (br_if $k_done (i32.gt_s (local.get $k) (local.get $n)))
        (local.set $sum (i32.const 0))
        (local.set $i (i32.const 0))
        (block $i_done
          (loop $i_loop
            (br_if $i_done (i32.ge_s (local.get $i) (local.get $k)))
            (local.set $ci (i32.load (i32.add (local.get $dp_base) (i32.mul (local.get $i) (i32.const 4)))))
            (local.set $cj (i32.load (i32.add (local.get $dp_base) (i32.mul (i32.sub (i32.sub (local.get $k) (i32.const 1)) (local.get $i)) (i32.const 4)))))
            (local.set $sum (i32.add (local.get $sum) (i32.mul (local.get $ci) (local.get $cj))))
            (local.set $i (i32.add (local.get $i) (i32.const 1)))
            (br $i_loop)))
        (i32.store (i32.add (local.get $dp_base) (i32.mul (local.get $k) (i32.const 4))) (local.get $sum))
        (local.set $k (i32.add (local.get $k) (i32.const 1)))
        (br $k_loop)))
    (i32.load (i32.add (local.get $dp_base) (i32.mul (local.get $n) (i32.const 4)))))
)
