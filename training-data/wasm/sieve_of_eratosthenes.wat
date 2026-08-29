(module
  (memory (export "memory") 1)

  (func $sieve (export "sieve") (param $limit i32)
    (local $i i32)
    (local $j i32)
    (local.set $i (i32.const 2))
    (block $outer_done
      (loop $outer
        (br_if $outer_done (i32.gt_s (i32.mul (local.get $i) (local.get $i)) (local.get $limit)))
        (if (i32.eqz (i32.load8_u (local.get $i)))
          (then
            (local.set $j (i32.mul (local.get $i) (local.get $i)))
            (block $inner_done
              (loop $inner
                (br_if $inner_done (i32.gt_s (local.get $j) (local.get $limit)))
                (i32.store8 (local.get $j) (i32.const 1))
                (local.set $j (i32.add (local.get $j) (local.get $i)))
                (br $inner)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $outer))))

  (func $is_prime (export "is_prime") (param $n i32) (result i32)
    (i32.eqz (i32.load8_u (local.get $n))))

  (export "memory" (memory 0))
)
