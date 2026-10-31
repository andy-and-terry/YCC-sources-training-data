(module
  (func (export "alternating_digit_sum") (param $n i32) (result i32)
    (local $total i32) (local $sign i32)
    (local.set $sign (i32.const 1))
    (block $done
      (loop $next
        (br_if $done (i32.eqz (local.get $n)))
        (local.set $total
          (i32.add (local.get $total)
            (i32.mul (local.get $sign) (i32.rem_u (local.get $n) (i32.const 10)))))
        (local.set $sign (i32.sub (i32.const 0) (local.get $sign)))
        (local.set $n (i32.div_u (local.get $n) (i32.const 10)))
        (br $next)))
    (local.get $total))
)
