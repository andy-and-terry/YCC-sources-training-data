(module
  (func (export "min") (param $a f64) (param $b f64) (result f64)
    (f64.min (local.get $a) (local.get $b)))

  (func (export "max") (param $a f64) (param $b f64) (result f64)
    (f64.max (local.get $a) (local.get $b)))

  (func (export "abs_sqrt") (param $x f64) (result f64)
    (f64.sqrt (f64.abs (local.get $x))))
)
