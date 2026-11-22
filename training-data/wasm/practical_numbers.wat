(module
  ;; Practical numbers: every m in 1..n is a sum of distinct divisors of n.
  ;; is_practical(12) == 1, is_practical(10) == 0 (n <= 62)
  (func (export "is_practical") (param $n i32) (result i32)
    (local $d i32) (local $reach i64) (local $mask i64)
    (local.set $reach (i64.const 1))   ;; bit i set <=> i is a subset sum
    (local.set $d (i32.const 1))
    (block $done
      (loop $next
        (br_if $done (i32.gt_u (local.get $d) (local.get $n)))
        (if (i32.eqz (i32.rem_u (local.get $n) (local.get $d)))
          (then
            (local.set $reach
              (i64.or (local.get $reach)
                      (i64.shl (local.get $reach) (i64.extend_i32_u (local.get $d)))))))
        (local.set $d (i32.add (local.get $d) (i32.const 1)))
        (br $next)))
    (local.set $mask
      (i64.sub (i64.shl (i64.const 1) (i64.extend_i32_u (i32.add (local.get $n) (i32.const 1))))
               (i64.const 1)))
    (i64.eq (i64.and (local.get $reach) (local.get $mask)) (local.get $mask))))
