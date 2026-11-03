(module
  (func $is_perfect_square (export "is_perfect_square") (param $n i32) (result i32)
    (local $r i32)
    (if (i32.lt_s (local.get $n) (i32.const 0)) (then (return (i32.const 0))))
    (local.set $r (i32.trunc_f64_u (f64.sqrt (f64.convert_i32_u (local.get $n)))))
    (i32.eq (i32.mul (local.get $r) (local.get $r)) (local.get $n))))
