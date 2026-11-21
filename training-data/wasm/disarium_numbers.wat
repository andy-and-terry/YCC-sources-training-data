(module
  ;; Disarium numbers: digits raised to their 1-based positions sum to n.
  ;; is_disarium(135) == 1  (1^1 + 3^2 + 5^3)
  (func $ipow (param $b i32) (param $e i32) (result i32)
    (local $r i32)
    (local.set $r (i32.const 1))
    (block $done
      (loop $next
        (br_if $done (i32.eqz (local.get $e)))
        (local.set $r (i32.mul (local.get $r) (local.get $b)))
        (local.set $e (i32.sub (local.get $e) (i32.const 1)))
        (br $next)))
    (local.get $r))

  (func (export "is_disarium") (param $n i32) (result i32)
    (local $m i32) (local $k i32) (local $sum i32)
    ;; k = number of digits
    (local.set $m (local.get $n))
    (block $counted
      (loop $count
        (br_if $counted (i32.eqz (local.get $m)))
        (local.set $k (i32.add (local.get $k) (i32.const 1)))
        (local.set $m (i32.div_u (local.get $m) (i32.const 10)))
        (br $count)))
    ;; walk digits right-to-left, the rightmost digit has position k
    (local.set $m (local.get $n))
    (block $done
      (loop $next
        (br_if $done (i32.eqz (local.get $m)))
        (local.set $sum
          (i32.add (local.get $sum)
            (call $ipow (i32.rem_u (local.get $m) (i32.const 10)) (local.get $k))))
        (local.set $k (i32.sub (local.get $k) (i32.const 1)))
        (local.set $m (i32.div_u (local.get $m) (i32.const 10)))
        (br $next)))
    (i32.eq (local.get $sum) (local.get $n))))
