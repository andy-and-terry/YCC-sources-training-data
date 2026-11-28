(module
  (func (export "pronic") (param $n i32) (result i32)
    (i32.mul (local.get $n) (i32.add (local.get $n) (i32.const 1))))

  (func (export "is_pronic") (param $x i32) (result i32)
    (local $n i32)
    (local.set $n
      (i32.trunc_f64_u (f64.floor (f64.sqrt (f64.convert_i32_u (local.get $x))))))
    (i32.eq
      (i32.mul (local.get $n) (i32.add (local.get $n) (i32.const 1)))
      (local.get $x))))
