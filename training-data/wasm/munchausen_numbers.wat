(module
  ;; Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
  ;; is_munchausen(3435) == 1
  (func $dpow (param $d i32) (result i32)
    (local $p i32) (local $i i32)
    (if (i32.eqz (local.get $d)) (then (return (i32.const 0))))
    (local.set $p (i32.const 1))
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $i) (local.get $d)))
        (local.set $p (i32.mul (local.get $p) (local.get $d)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (local.get $p))

  (func (export "is_munchausen") (param $n i32) (result i32)
    (local $m i32) (local $sum i32)
    (local.set $m (local.get $n))
    (block $done
      (loop $next
        (br_if $done (i32.eqz (local.get $m)))
        (local.set $sum
          (i32.add (local.get $sum)
            (call $dpow (i32.rem_u (local.get $m) (i32.const 10)))))
        (local.set $m (i32.div_u (local.get $m) (i32.const 10)))
        (br $next)))
    (i32.eq (local.get $sum) (local.get $n))))
