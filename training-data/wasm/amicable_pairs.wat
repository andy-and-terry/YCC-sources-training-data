;; Sum of proper divisors d(n); a and b are amicable when d(a) = b and d(b) = a
(module
  (func $d (export "d") (param $n i32) (result i32)
    (local $i i32) (local $sum i32)
    (local.set $i (i32.const 1))
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (if (i32.eqz (i32.rem_u (local.get $n) (local.get $i)))
          (then (local.set $sum (i32.add (local.get $sum) (local.get $i)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (local.get $sum))

  (func (export "is_amicable") (param $a i32) (result i32)
    (local $b i32)
    (local.set $b (call $d (local.get $a)))
    (i32.and
      (i32.ne (local.get $a) (local.get $b))
      (i32.eq (call $d (local.get $b)) (local.get $a)))))
