(module
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
  ;; Smallest prime p such that p and n-p are prime; 0 if none.
  (func (export "goldbach") (param $n i32) (result i32)
    (local $p i32)
    (local.set $p (i32.const 2))
    (block $done
      (loop $next
        (br_if $done (i32.gt_u (local.get $p) (i32.div_u (local.get $n) (i32.const 2))))
        (if (i32.and (call $is_prime (local.get $p)) (call $is_prime (i32.sub (local.get $n) (local.get $p))))
          (then (return (local.get $p))))
        (local.set $p (i32.add (local.get $p) (i32.const 1)))
        (br $next)))
    (i32.const 0)))
