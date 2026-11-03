(module
  (func $triangular (export "triangular") (param $n i32) (result i32)
    (i32.shr_u (i32.mul (local.get $n) (i32.add (local.get $n) (i32.const 1))) (i32.const 1)))
  (func $is_triangular (export "is_triangular") (param $t i32) (result i32)
    (local $d i32) (local $r i32)
    (local.set $d (i32.add (i32.mul (local.get $t) (i32.const 8)) (i32.const 1)))
    (local.set $r (i32.trunc_f64_u (f64.sqrt (f64.convert_i32_u (local.get $d)))))
    (i32.eq (i32.mul (local.get $r) (local.get $r)) (local.get $d))))
