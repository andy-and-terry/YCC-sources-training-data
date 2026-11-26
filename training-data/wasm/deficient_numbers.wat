(module
  ;; Deficient numbers below 100; count() == 76.

  (func $proper_sum (param $n i32) (result i32)
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

  (func (export "count") (result i32)
    (local $i i32) (local $c i32)
    (local.set $i (i32.const 1))
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $i) (i32.const 100)))
        (if (i32.lt_u (call $proper_sum (local.get $i)) (local.get $i)) (then (local.set $c (i32.add (local.get $c) (i32.const 1)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (local.get $c))
)
