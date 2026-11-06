;; Fermat primality test with base 2; 561 (Carmichael) fools it
(module
  (func $powmod (param $b i64) (param $e i64) (param $m i64) (result i64)
    (local $r i64)
    (local.set $r (i64.const 1))
    (local.set $b (i64.rem_u (local.get $b) (local.get $m)))
    (block $done
      (loop $next
        (br_if $done (i64.eqz (local.get $e)))
        (if (i32.wrap_i64 (i64.and (local.get $e) (i64.const 1)))
          (then (local.set $r (i64.rem_u (i64.mul (local.get $r) (local.get $b)) (local.get $m)))))
        (local.set $b (i64.rem_u (i64.mul (local.get $b) (local.get $b)) (local.get $m)))
        (local.set $e (i64.shr_u (local.get $e) (i64.const 1)))
        (br $next)))
    (local.get $r))

  (func (export "probably_prime") (param $n i64) (result i32)
    (i32.and
      (i64.gt_u (local.get $n) (i64.const 2))
      (i64.eq (call $powmod (i64.const 2) (i64.sub (local.get $n) (i64.const 1)) (local.get $n))
              (i64.const 1)))))
