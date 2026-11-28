(module
  (func $digit_count (param $n i32) (result i32)
    (local $len i32)
    (block $done
      (loop $next
        (br_if $done (i32.eqz (local.get $n)))
        (local.set $len (i32.add (local.get $len) (i32.const 1)))
        (local.set $n (i32.div_u (local.get $n) (i32.const 10)))
        (br $next)))
    (local.get $len))

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

  (func (export "is_armstrong") (param $n i32) (result i32)
    (local $len i32) (local $m i32) (local $sum i32)
    (local.set $len (call $digit_count (local.get $n)))
    (local.set $m (local.get $n))
    (block $done
      (loop $next
        (br_if $done (i32.eqz (local.get $m)))
        (local.set $sum
          (i32.add (local.get $sum)
            (call $ipow (i32.rem_u (local.get $m) (i32.const 10)) (local.get $len))))
        (local.set $m (i32.div_u (local.get $m) (i32.const 10)))
        (br $next)))
    (i32.eq (local.get $sum) (local.get $n))))
