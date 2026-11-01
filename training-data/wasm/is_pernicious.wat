(module
  ;; Pernicious number: the popcount is prime.
  (func $is_prime (param $n i32) (result i32)
    (local $d i32)
    (if (i32.lt_u (local.get $n) (i32.const 2)) (then (return (i32.const 0))))
    (local.set $d (i32.const 2))
    (block $done
      (loop $trial
        (br_if $done (i32.gt_u (i32.mul (local.get $d) (local.get $d)) (local.get $n)))
        (if (i32.eqz (i32.rem_u (local.get $n) (local.get $d)))
          (then (return (i32.const 0))))
        (local.set $d (i32.add (local.get $d) (i32.const 1)))
        (br $trial)))
    (i32.const 1))

  (func (export "is_pernicious") (param $n i32) (result i32)
    (call $is_prime (i32.popcnt (local.get $n)))))
