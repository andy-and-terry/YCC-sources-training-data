(module
  ;; 1^2 + 2^2 + ... + n^2
  (func $sum_of_squares (export "sum_of_squares") (param $n i32) (result i32)
    (local $i i32)
    (local $sum i32)
    (local.set $i (i32.const 1))
    (block $done
      (loop $next
        (br_if $done (i32.gt_s (local.get $i) (local.get $n)))
        (local.set $sum
          (i32.add (local.get $sum) (i32.mul (local.get $i) (local.get $i))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (local.get $sum))

  ;; closed form: n(n+1)(2n+1)/6
  (func $sum_of_squares_formula (export "sum_of_squares_formula") (param $n i32) (result i32)
    (i32.div_u
      (i32.mul
        (i32.mul (local.get $n) (i32.add (local.get $n) (i32.const 1)))
        (i32.add (i32.mul (local.get $n) (i32.const 2)) (i32.const 1)))
      (i32.const 6)))
)
