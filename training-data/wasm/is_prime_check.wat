(module
  (func $is_prime_check (export "is_prime_check") (param $n i32) (result i32)
    (local $i i32)
    (if (result i32) (i32.lt_s (local.get $n) (i32.const 2))
      (then (i32.const 0))
      (else
        (local.set $i (i32.const 2))
        (block $composite (result i32)
          (loop $loop (result i32)
            (if (result i32) (i32.gt_s (i32.mul (local.get $i) (local.get $i)) (local.get $n))
              (then (i32.const 1))
              (else
                (if (result i32) (i32.eqz (i32.rem_s (local.get $n) (local.get $i)))
                  (then (i32.const 0))
                  (else
                    (local.set $i (i32.add (local.get $i) (i32.const 1)))
                    (br $loop))))))))))
)
