;; is_twin_prime(p): p prime and (p-2 or p+2 prime). True for 3 5 7 11 13 17 19 29 31 ...
(module
  (func $is_prime (param $n i32) (result i32)
    (local $i i32)
    (if (i32.lt_u (local.get $n) (i32.const 2)) (then (return (i32.const 0))))
    (local.set $i (i32.const 2))
    (block $done
      (loop $next
        (br_if $done (i32.gt_u (i32.mul (local.get $i) (local.get $i)) (local.get $n)))
        (if (i32.eqz (i32.rem_u (local.get $n) (local.get $i))) (then (return (i32.const 0))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (i32.const 1))

  (func (export "is_twin_prime") (param $p i32) (result i32)
    (if (i32.eqz (call $is_prime (local.get $p))) (then (return (i32.const 0))))
    (i32.or
      (call $is_prime (i32.add (local.get $p) (i32.const 2)))
      (i32.and
        (i32.ge_u (local.get $p) (i32.const 2))
        (call $is_prime (i32.sub (local.get $p) (i32.const 2)))))))
