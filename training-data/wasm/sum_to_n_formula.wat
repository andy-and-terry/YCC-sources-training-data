(module
  ;; Gauss sum in i64 to avoid overflow: n*(n+1)/2
  (func $sum_to_n (export "sum_to_n") (param $n i32) (result i64)
    (local $w i64)
    (local.set $w (i64.extend_i32_u (local.get $n)))
    (i64.shr_u (i64.mul (local.get $w) (i64.add (local.get $w) (i64.const 1))) (i64.const 1))))
