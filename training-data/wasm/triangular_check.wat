(module
  ;; n is triangular if 8n+1 is a perfect square (f64 sqrt used for the check).
  (func $is_triangular (export "is_triangular") (param $n i32) (result i32)
    (local $d f64) (local $r f64)
    (local.set $d (f64.convert_i32_u (i32.add (i32.mul (local.get $n) (i32.const 8)) (i32.const 1))))
    (local.set $r (f64.sqrt (local.get $d)))
    (f64.eq (local.get $r) (f64.floor (local.get $r)))))
