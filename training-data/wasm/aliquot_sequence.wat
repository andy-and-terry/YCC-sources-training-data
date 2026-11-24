(module
  ;; Aliquot sequence: replace n by the sum of its proper divisors.
  (func $aliquot_sum (export "aliquot_sum") (param $n i32) (result i32)
    (local $d i32) (local $s i32)
    (local.set $d (i32.const 1))
    (block $done
      (loop $next
        (br_if $done (i32.gt_u (local.get $d) (i32.div_u (local.get $n) (i32.const 2))))
        (if (i32.eqz (i32.rem_u (local.get $n) (local.get $d)))
          (then (local.set $s (i32.add (local.get $s) (local.get $d)))))
        (local.set $d (i32.add (local.get $d) (i32.const 1)))
        (br $next)))
    (local.get $s))

  ;; Steps from n down to 1; steps(12) == 6 (12 16 15 9 4 3 1).
  (func (export "steps_to_one") (param $n i32) (result i32)
    (local $steps i32)
    (block $done
      (loop $next
        (br_if $done (i32.le_u (local.get $n) (i32.const 1)))
        (local.set $n (call $aliquot_sum (local.get $n)))
        (local.set $steps (i32.add (local.get $steps) (i32.const 1)))
        (br $next)))
    (local.get $steps)))
