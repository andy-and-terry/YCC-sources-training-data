(module
  (func $hypot (export "hypot") (param $a f64) (param $b f64) (result f64)
    (f64.sqrt
      (f64.add
        (f64.mul (local.get $a) (local.get $a))
        (f64.mul (local.get $b) (local.get $b)))))

  (func (export "distance") (param $x1 f64) (param $y1 f64) (param $x2 f64) (param $y2 f64) (result f64)
    (call $hypot
      (f64.sub (local.get $x2) (local.get $x1))
      (f64.sub (local.get $y2) (local.get $y1))))
)
