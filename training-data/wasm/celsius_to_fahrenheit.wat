(module
  (func $c_to_f (export "c_to_f") (param $c f64) (result f64)
    (f64.add
      (f64.mul (local.get $c) (f64.const 1.8))
      (f64.const 32)))

  (func $f_to_c (export "f_to_c") (param $f f64) (result f64)
    (f64.div
      (f64.sub (local.get $f) (f64.const 32))
      (f64.const 1.8)))

  (func $c_to_f_i32 (export "c_to_f_i32") (param $c i32) (result i32)
    (i32.add
      (i32.div_s (i32.mul (local.get $c) (i32.const 9)) (i32.const 5))
      (i32.const 32)))

  (func $c_to_k (export "c_to_k") (param $c f32) (result f32)
    (f32.add (local.get $c) (f32.const 273.15)))

  (func $is_freezing (export "is_freezing") (param $c f64) (result i32)
    (f64.le (local.get $c) (f64.const 0)))
)
