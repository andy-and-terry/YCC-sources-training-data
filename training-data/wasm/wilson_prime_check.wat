(module
  ;; Wilson's theorem: returns 1 when n is prime.
  (func (export "wilson") (param $n i32) (result i32)
    (local $i i32) (local $f i64)
    (if (i32.lt_u (local.get $n) (i32.const 2)) (then (return (i32.const 0))))
    (local.set $f (i64.const 1))
    (local.set $i (i32.const 2))
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (local.set $f
          (i64.rem_u (i64.mul (local.get $f) (i64.extend_i32_u (local.get $i))) (i64.extend_i32_u (local.get $n))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (i64.eq (local.get $f) (i64.extend_i32_u (i32.sub (local.get $n) (i32.const 1))))))
