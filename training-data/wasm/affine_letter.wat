(module
  ;; y = (a*x + b) mod 26 for a letter index x in 0..25
  (func (export "affine") (param $x i32) (param $a i32) (param $b i32) (result i32)
    (i32.rem_u
      (i32.add (i32.mul (local.get $a) (local.get $x)) (local.get $b))
      (i32.const 26))))
