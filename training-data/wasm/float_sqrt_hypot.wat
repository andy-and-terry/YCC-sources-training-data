(module
  (func $hypot (export "hypot") (param $a f64) (param $b f64) (result f64)
    (f64.sqrt
      (f64.add
        (f64.mul (local.get $a) (local.get $a))
        (f64.mul (local.get $b) (local.get $b)))))

  (func $lerp (export "lerp") (param $a f64) (param $b f64) (param $t f64) (result f64)
    (f64.add
      (local.get $a)
      (f64.mul (f64.sub (local.get $b) (local.get $a)) (local.get $t))))

  (func (export "round_to_int") (param $x f64) (result i32)
    (i32.trunc_f64_s (f64.nearest (local.get $x))))

  (func (export "floor_ceil_span") (param $x f64) (result f64)
    (f64.sub (f64.ceil (local.get $x)) (f64.floor (local.get $x))))
)
