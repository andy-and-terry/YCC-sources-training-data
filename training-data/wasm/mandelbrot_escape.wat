(module
  (func (export "escape") (param $cr f64) (param $ci f64) (result i32)
    (local $zr f64) (local $zi f64) (local $t f64) (local $n i32)
    (block $done
      (loop $l
        (br_if $done (i32.ge_u (local.get $n) (i32.const 30)))
        (br_if $done (f64.ge
          (f64.add (f64.mul (local.get $zr) (local.get $zr)) (f64.mul (local.get $zi) (local.get $zi)))
          (f64.const 4)))
        (local.set $t (f64.add
          (f64.sub (f64.mul (local.get $zr) (local.get $zr)) (f64.mul (local.get $zi) (local.get $zi)))
          (local.get $cr)))
        (local.set $zi (f64.add (f64.mul (f64.const 2) (f64.mul (local.get $zr) (local.get $zi))) (local.get $ci)))
        (local.set $zr (local.get $t))
        (local.set $n (i32.add (local.get $n) (i32.const 1)))
        (br $l)))
    (local.get $n)))
