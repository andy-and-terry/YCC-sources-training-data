(module
  ;; Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!
  ;; lah(5, 2) == 240; row 5 is 120 240 120 20 1
  (func $fact (param $n i64) (result i64)
    (local $f i64)
    (local.set $f (i64.const 1))
    (block $done
      (loop $next
        (br_if $done (i64.le_u (local.get $n) (i64.const 1)))
        (local.set $f (i64.mul (local.get $f) (local.get $n)))
        (local.set $n (i64.sub (local.get $n) (i64.const 1)))
        (br $next)))
    (local.get $f))

  (func $comb (param $n i64) (param $k i64) (result i64)
    (i64.div_u
      (call $fact (local.get $n))
      (i64.mul (call $fact (local.get $k))
               (call $fact (i64.sub (local.get $n) (local.get $k))))))

  (func (export "lah") (param $n i64) (param $k i64) (result i64)
    (i64.div_u
      (i64.mul
        (call $comb (i64.sub (local.get $n) (i64.const 1)) (i64.sub (local.get $k) (i64.const 1)))
        (call $fact (local.get $n)))
      (call $fact (local.get $k)))))
