(module
  ;; Sophie Germain primes: p prime and 2p + 1 prime.
  ;; is_sophie_germain(11) == 1, is_sophie_germain(7) == 0; count_below(100) == 10
  (func $is_prime (param $n i32) (result i32)
    (local $d i32)
    (if (i32.lt_u (local.get $n) (i32.const 2)) (then (return (i32.const 0))))
    (local.set $d (i32.const 2))
    (block $done
      (loop $next
        (br_if $done (i32.gt_u (i32.mul (local.get $d) (local.get $d)) (local.get $n)))
        (if (i32.eqz (i32.rem_u (local.get $n) (local.get $d)))
          (then (return (i32.const 0))))
        (local.set $d (i32.add (local.get $d) (i32.const 1)))
        (br $next)))
    (i32.const 1))

  (func $is_sg (export "is_sophie_germain") (param $p i32) (result i32)
    (i32.and
      (call $is_prime (local.get $p))
      (call $is_prime (i32.add (i32.mul (local.get $p) (i32.const 2)) (i32.const 1)))))

  (func (export "count_below") (param $limit i32) (result i32)
    (local $p i32) (local $count i32)
    (local.set $p (i32.const 2))
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $p) (local.get $limit)))
        (local.set $count (i32.add (local.get $count) (call $is_sg (local.get $p))))
        (local.set $p (i32.add (local.get $p) (i32.const 1)))
        (br $next)))
    (local.get $count)))
