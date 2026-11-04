(module
  (func (export "heron") (param $a f64) (param $b f64) (param $c f64) (result f64)
    (local $s f64)
    (local.set $s (f64.div (f64.add (f64.add (local.get $a) (local.get $b)) (local.get $c)) (f64.const 2)))
    (f64.sqrt
      (f64.mul
        (f64.mul (local.get $s) (f64.sub (local.get $s) (local.get $a)))
        (f64.mul (f64.sub (local.get $s) (local.get $b)) (f64.sub (local.get $s) (local.get $c)))))))
