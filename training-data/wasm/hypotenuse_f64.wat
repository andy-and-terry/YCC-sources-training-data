(module
  (func $hypot (export "hypot") (param $a f64) (param $b f64) (result f64)
    (f64.sqrt
      (f64.add
        (f64.mul (local.get $a) (local.get $a))
        (f64.mul (local.get $b) (local.get $b)))))

  (func $distance (export "distance") (param $x1 f64) (param $y1 f64) (param $x2 f64) (param $y2 f64) (result f64)
    (call $hypot
      (f64.sub (local.get $x2) (local.get $x1))
      (f64.sub (local.get $y2) (local.get $y1))))

  (func $circle_area (export "circle_area") (param $r f64) (result f64)
    (f64.mul
      (f64.const 3.141592653589793)
      (f64.mul (local.get $r) (local.get $r))))

  (func $round_to_int (export "round_to_int") (param $x f64) (result i32)
    (i32.trunc_f64_s (f64.nearest (local.get $x))))

  (func $lerp (export "lerp") (param $a f64) (param $b f64) (param $t f64) (result f64)
    (f64.add (local.get $a)
      (f64.mul (f64.sub (local.get $b) (local.get $a)) (local.get $t))))
)
