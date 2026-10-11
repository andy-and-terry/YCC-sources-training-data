(module
  (func $copysign (export "copysign") (param $mag f64) (param $sgn f64) (result f64)
    (f64.copysign (local.get $mag) (local.get $sgn)))
  (func $neg (export "neg") (param $x f64) (result f64)
    (f64.neg (local.get $x)))
  (func $fabs (export "fabs") (param $x f64) (result f64)
    (f64.abs (local.get $x))))
