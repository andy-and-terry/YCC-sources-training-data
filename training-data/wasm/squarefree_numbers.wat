(module
  ;; Squarefree numbers up to 100; count() == 61.

  (func $squarefree (param $n i32) (result i32)
    (local $d i32)
    (local.set $d (i32.const 2))
    (block $done
      (loop $next
        (br_if $done (i32.gt_u (i32.mul (local.get $d) (local.get $d)) (local.get $n)))
        (if (i32.eqz (i32.rem_u (local.get $n) (i32.mul (local.get $d) (local.get $d)))) (then (return (i32.const 0))))
        (local.set $d (i32.add (local.get $d) (i32.const 1)))
        (br $next)))
    (i32.const 1))

  (func (export "count") (result i32)
    (local $i i32) (local $c i32)
    (local.set $i (i32.const 1))
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $i) (i32.const 101)))
        (if (call $squarefree (local.get $i)) (then (local.set $c (i32.add (local.get $c) (i32.const 1)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (local.get $c))
)
