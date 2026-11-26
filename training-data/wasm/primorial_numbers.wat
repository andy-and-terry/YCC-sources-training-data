(module
  ;; Primorials up to 1e6, including 1; count() == 8.
  (func $is_prime (param $n i32) (result i32)
    (local $d i32)
    (if (i32.lt_u (local.get $n) (i32.const 2)) (then (return (i32.const 0))))
    (local.set $d (i32.const 2))
    (block $done
      (loop $next
        (br_if $done (i32.gt_u (i32.mul (local.get $d) (local.get $d)) (local.get $n)))
        (if (i32.eqz (i32.rem_u (local.get $n) (local.get $d))) (then (return (i32.const 0))))
        (local.set $d (i32.add (local.get $d) (i32.const 1)))
        (br $next)))
    (i32.const 1))

  (func (export "count") (result i32)
    (local $p i32) (local $acc i32) (local $c i32)
    (local.set $c (i32.const 1))
    (local.set $acc (i32.const 1))
    (local.set $p (i32.const 2))
    (block $done
      (loop $next
        (if (call $is_prime (local.get $p))
          (then
            (br_if $done (i32.gt_u (i32.mul (local.get $acc) (local.get $p)) (i32.const 1000000)))
            (local.set $acc (i32.mul (local.get $acc) (local.get $p)))
            (local.set $c (i32.add (local.get $c) (i32.const 1)))))
        (local.set $p (i32.add (local.get $p) (i32.const 1)))
        (br $next)))
    (local.get $c))
)
