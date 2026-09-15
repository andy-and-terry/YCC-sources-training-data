(module
  (memory (export "memory") 1)

  ;; For each of the $len i32s at $base, writes the next element to its right
  ;; that is strictly greater (or -1 if none) into $out_base. Brute force O(n^2).
  (func $next_greater (export "next_greater") (param $base i32) (param $len i32) (param $out_base i32)
    (local $i i32)
    (local $j i32)
    (local $xi i32)
    (local $xj i32)
    (local $result i32)
    (local.set $i (i32.const 0))
    (block $outer_done
      (loop $outer
        (br_if $outer_done (i32.ge_s (local.get $i) (local.get $len)))
        (local.set $xi (i32.load (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4)))))
        (local.set $result (i32.const -1))
        (local.set $j (i32.add (local.get $i) (i32.const 1)))
        (block $inner_done
          (loop $inner
            (br_if $inner_done (i32.ge_s (local.get $j) (local.get $len)))
            (local.set $xj (i32.load (i32.add (local.get $base) (i32.mul (local.get $j) (i32.const 4)))))
            (if (i32.gt_s (local.get $xj) (local.get $xi))
              (then
                (local.set $result (local.get $xj))
                (br $inner_done)))
            (local.set $j (i32.add (local.get $j) (i32.const 1)))
            (br $inner)))
        (i32.store (i32.add (local.get $out_base) (i32.mul (local.get $i) (i32.const 4))) (local.get $result))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $outer))))
)
