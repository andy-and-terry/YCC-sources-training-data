(module
  ;; Sexy primes below 100; count() == 16.
  (func $is_prime (param $n i32) (result i32)
    (local $d i32)
    (if (i32.lt_u (local.get $n) (i32.const 2)) (then (return (i32.const 0))))
    (local.set $d (i32.const 2))
    (block $done
      (loop $next
        (br_if $done (i32.gt_u (i32.mul (local.get $d) (local.get $d)) (local.get $n)))
        (if (i32.eqz (i32.rem_u (local.get $n) (local.get $d))) (then (return (i32.const 0))))
        (local.set $d (i32.add (local.get $d) (i32.const 1)))
        (br $next)))
    (i32.const 1))

  (func (export "count") (result i32)
    (local $i i32) (local $c i32)
    (local.set $i (i32.const 2))
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $i) (i32.const 100)))
        (if (i32.and (call $is_prime (local.get $i)) (call $is_prime (i32.add (local.get $i) (i32.const 6)))) (then (local.set $c (i32.add (local.get $c) (i32.const 1)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (local.get $c))
)
