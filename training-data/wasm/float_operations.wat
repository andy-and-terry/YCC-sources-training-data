(module
  (func $circle_area (export "circle_area") (param $radius f64) (result f64)
    (f64.mul (f64.mul (f64.const 3.14159265358979) (local.get $radius)) (local.get $radius)))

  (func $average (export "average") (param $a f64) (param $b f64) (result f64)
    (f64.div (f64.add (local.get $a) (local.get $b)) (f64.const 2.0)))
)
