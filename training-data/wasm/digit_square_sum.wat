(module
  (func $digit_square_sum (export "digit_square_sum") (param $n i32) (result i32)
    (local $sum i32) (local $d i32)
    (if (i32.lt_s (local.get $n) (i32.const 0))
      (then (local.set $n (i32.sub (i32.const 0) (local.get $n)))))
    (block $done
      (loop $next
        (br_if $done (i32.eqz (local.get $n)))
        (local.set $d (i32.rem_u (local.get $n) (i32.const 10)))
        (local.set $sum (i32.add (local.get $sum) (i32.mul (local.get $d) (local.get $d))))
        (local.set $n (i32.div_u (local.get $n) (i32.const 10)))
        (br $next)))
    (local.get $sum)))
