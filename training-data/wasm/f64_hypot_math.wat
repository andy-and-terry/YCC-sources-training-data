(module
  (func (export "hypot") (param $a f64) (param $b f64) (result f64)
    (f64.sqrt
      (f64.add
        (f64.mul (local.get $a) (local.get $a))
        (f64.mul (local.get $b) (local.get $b))))))
