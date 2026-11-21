(module
  ;; Bouncy numbers: digits are neither non-decreasing nor non-increasing.
  ;; is_bouncy(101) == 1, is_bouncy(123) == 0, is_bouncy(321) == 0
  (func (export "is_bouncy") (param $n i32) (result i32)
    (local $m i32) (local $prev i32) (local $d i32) (local $inc i32) (local $dec i32)
    (local.set $inc (i32.const 1))
    (local.set $dec (i32.const 1))
    (local.set $prev (i32.rem_u (local.get $n) (i32.const 10)))
    (local.set $m (i32.div_u (local.get $n) (i32.const 10)))
    (block $done
      (loop $next
        (br_if $done (i32.eqz (local.get $m)))
        (local.set $d (i32.rem_u (local.get $m) (i32.const 10)))
        (if (i32.gt_u (local.get $d) (local.get $prev))
          (then (local.set $inc (i32.const 0))))
        (if (i32.lt_u (local.get $d) (local.get $prev))
          (then (local.set $dec (i32.const 0))))
        (local.set $prev (local.get $d))
        (local.set $m (i32.div_u (local.get $m) (i32.const 10)))
        (br $next)))
    (i32.and (i32.eqz (local.get $inc)) (i32.eqz (local.get $dec)))))
