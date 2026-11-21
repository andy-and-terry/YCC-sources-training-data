(module
  ;; Amicable pairs: s(a) = b and s(b) = a with a < b.
  ;; is_amicable_start(220) == 1, is_amicable_start(1184) == 1
  (func $s (param $n i32) (result i32)
    (local $d i32) (local $t i32)
    (local.set $d (i32.const 1))
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $d) (local.get $n)))
        (if (i32.eqz (i32.rem_u (local.get $n) (local.get $d)))
          (then (local.set $t (i32.add (local.get $t) (local.get $d)))))
        (local.set $d (i32.add (local.get $d) (i32.const 1)))
        (br $next)))
    (local.get $t))

  (func (export "is_amicable_start") (param $a i32) (result i32)
    (local $b i32)
    (local.set $b (call $s (local.get $a)))
    (i32.and
      (i32.gt_u (local.get $b) (local.get $a))
      (i32.eq (call $s (local.get $b)) (local.get $a)))))
