(module
  ;; Sum of proper divisors of n.
  (func (export "aliquot") (param $n i32) (result i32)
    (local $d i32) (local $s i32)
    (local.set $d (i32.const 1))
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $d) (local.get $n)))
        (if (i32.eqz (i32.rem_u (local.get $n) (local.get $d)))
          (then (local.set $s (i32.add (local.get $s) (local.get $d)))))
        (local.set $d (i32.add (local.get $d) (i32.const 1)))
        (br $next)))
    (local.get $s)))
