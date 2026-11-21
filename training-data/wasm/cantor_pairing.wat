(module
  ;; Cantor pairing function and its inverse.
  ;; cantor_pair(3, 4) == 32; unpair_x(32) == 3; unpair_y(32) == 4
  (func $pair (export "cantor_pair") (param $x i32) (param $y i32) (result i32)
    (i32.add
      (i32.div_u
        (i32.mul
          (i32.add (local.get $x) (local.get $y))
          (i32.add (i32.add (local.get $x) (local.get $y)) (i32.const 1)))
        (i32.const 2))
      (local.get $y)))

  ;; w = (floor(sqrt(8z + 1)) - 1) / 2
  (func $w (param $z i32) (result i32)
    (i32.div_u
      (i32.sub
        (i32.trunc_f64_u
          (f64.sqrt
            (f64.convert_i32_u
              (i32.add (i32.mul (local.get $z) (i32.const 8)) (i32.const 1)))))
        (i32.const 1))
      (i32.const 2)))

  (func $y (param $z i32) (result i32)
    (local $w i32)
    (local.set $w (call $w (local.get $z)))
    (i32.sub
      (local.get $z)
      (i32.div_u
        (i32.mul (local.get $w) (i32.add (local.get $w) (i32.const 1)))
        (i32.const 2))))

  (func (export "unpair_y") (param $z i32) (result i32)
    (call $y (local.get $z)))

  (func (export "unpair_x") (param $z i32) (result i32)
    (i32.sub (call $w (local.get $z)) (call $y (local.get $z)))))
