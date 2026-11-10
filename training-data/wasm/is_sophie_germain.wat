;; is_sophie_germain(p): p and 2p+1 both prime. True for 2 3 5 11 23 29 41 53 83 89 ...
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

  (func (export "is_sophie_germain") (param $p i32) (result i32)
    (i32.and
      (call $is_prime (local.get $p))
      (call $is_prime (i32.add (i32.mul (local.get $p) (i32.const 2)) (i32.const 1))))))
