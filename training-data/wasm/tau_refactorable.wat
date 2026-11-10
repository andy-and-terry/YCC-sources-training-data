;; tau(n) counts divisors; is_refactorable(n) = n mod tau(n) == 0 (1 2 8 9 12 18 24 36 40 56 ...)
(module
  (func $tau (export "tau") (param $n i32) (result i32)
    (local $d i32) (local $c i32)
    (local.set $d (i32.const 1))
    (block $done
      (loop $next
        (br_if $done (i32.gt_u (local.get $d) (local.get $n)))
        (if (i32.eqz (i32.rem_u (local.get $n) (local.get $d)))
          (then (local.set $c (i32.add (local.get $c) (i32.const 1)))))
        (local.set $d (i32.add (local.get $d) (i32.const 1)))
        (br $next)))
    (local.get $c))

  (func (export "is_refactorable") (param $n i32) (result i32)
    (i32.eqz (i32.rem_u (local.get $n) (call $tau (local.get $n))))))
