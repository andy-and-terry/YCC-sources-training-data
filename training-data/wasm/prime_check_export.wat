;; is_prime_check(n) -> 1 or 0; helper reused by the emirp / Sophie Germain / twin-prime checks
(module
  (func (export "is_prime_check") (param $n i32) (result i32)
    (local $i i32)
    (if (i32.lt_u (local.get $n) (i32.const 2)) (then (return (i32.const 0))))
    (local.set $i (i32.const 2))
    (block $done
      (loop $next
        (br_if $done (i32.gt_u (i32.mul (local.get $i) (local.get $i)) (local.get $n)))
        (if (i32.eqz (i32.rem_u (local.get $n) (local.get $i))) (then (return (i32.const 0))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (i32.const 1)))
