(module
  (func $is_prime (param $n i32) (result i32)
    (local $i i32)
    (if (i32.lt_u (local.get $n) (i32.const 2)) (then (return (i32.const 0))))
    (local.set $i (i32.const 2))
    (block $done
      (loop $next
        (br_if $done (i32.gt_u (i32.mul (local.get $i) (local.get $i)) (local.get $n)))
        (if (i32.eqz (i32.rem_u (local.get $n) (local.get $i))) (then (return (i32.const 0))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (i32.const 1))

  ;; 3y^2 + 3y + 1 when prime, else 0
  (func (export "cuban") (param $y i32) (result i32)
    (local $p i32)
    (local.set $p (i32.add (i32.add
      (i32.mul (i32.const 3) (i32.mul (local.get $y) (local.get $y)))
      (i32.mul (i32.const 3) (local.get $y))) (i32.const 1)))
    (select (local.get $p) (i32.const 0) (call $is_prime (local.get $p))))
)
