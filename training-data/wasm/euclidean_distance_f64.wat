(module
  (func $distance (export "distance")
        (param $x1 f64) (param $y1 f64) (param $x2 f64) (param $y2 f64) (result f64)
    (local $dx f64)
    (local $dy f64)
    (local.set $dx (f64.sub (local.get $x2) (local.get $x1)))
    (local.set $dy (f64.sub (local.get $y2) (local.get $y1)))
    (f64.sqrt
      (f64.add
        (f64.mul (local.get $dx) (local.get $dx))
        (f64.mul (local.get $dy) (local.get $dy)))))

  (func $manhattan (export "manhattan")
        (param $x1 f64) (param $y1 f64) (param $x2 f64) (param $y2 f64) (result f64)
    (f64.add
      (f64.abs (f64.sub (local.get $x2) (local.get $x1)))
      (f64.abs (f64.sub (local.get $y2) (local.get $y1)))))

  (func $lerp (export "lerp") (param $a f64) (param $b f64) (param $t f64) (result f64)
    (f64.add (local.get $a)
      (f64.mul (f64.sub (local.get $b) (local.get $a)) (local.get $t))))
)
