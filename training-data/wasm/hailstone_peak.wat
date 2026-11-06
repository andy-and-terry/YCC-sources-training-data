;; Highest value reached by the Collatz (hailstone) sequence from n
(module
  (func (export "peak") (param $n i64) (result i64)
    (local $best i64)
    (local.set $best (local.get $n))
    (block $done
      (loop $next
        (br_if $done (i64.eq (local.get $n) (i64.const 1)))
        (local.set $n
          (if (result i64) (i64.eqz (i64.and (local.get $n) (i64.const 1)))
            (then (i64.shr_u (local.get $n) (i64.const 1)))
            (else (i64.add (i64.mul (local.get $n) (i64.const 3)) (i64.const 1)))))
        (if (i64.gt_u (local.get $n) (local.get $best))
          (then (local.set $best (local.get $n))))
        (br $next)))
    (local.get $best)))
