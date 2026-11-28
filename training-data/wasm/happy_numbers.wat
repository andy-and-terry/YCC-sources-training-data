(module
  (func $digit_square_sum (param $n i32) (result i32)
    (local $s i32) (local $d i32)
    (block $done
      (loop $next
        (br_if $done (i32.eqz (local.get $n)))
        (local.set $d (i32.rem_u (local.get $n) (i32.const 10)))
        (local.set $s (i32.add (local.get $s) (i32.mul (local.get $d) (local.get $d))))
        (local.set $n (i32.div_u (local.get $n) (i32.const 10)))
        (br $next)))
    (local.get $s))

  (func (export "is_happy") (param $n i32) (result i32)
    (local $i i32)
    (block $done
      (loop $step
        (br_if $done (i32.eq (local.get $n) (i32.const 1)))
        (br_if $done (i32.ge_u (local.get $i) (i32.const 20)))
        (local.set $n (call $digit_square_sum (local.get $n)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $step)))
    (i32.eq (local.get $n) (i32.const 1))))
