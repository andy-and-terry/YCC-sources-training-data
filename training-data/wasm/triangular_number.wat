(module
  ;; Closed form n * (n + 1) / 2 computed in i64 to avoid overflow.
  (func $triangular (export "triangular") (param $n i32) (result i64)
    (local $w i64)
    (local.set $w (i64.extend_i32_u (local.get $n)))
    (i64.shr_u
      (i64.mul (local.get $w) (i64.add (local.get $w) (i64.const 1)))
      (i64.const 1)))

  ;; Iterative version for comparison.
  (func $triangular_loop (export "triangular_loop") (param $n i32) (result i64)
    (local $i i32)
    (local $sum i64)
    (loop $again
      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (local.set $sum (i64.add (local.get $sum) (i64.extend_i32_u (local.get $i))))
      (br_if $again (i32.lt_u (local.get $i) (local.get $n))))
    (local.get $sum))
)
