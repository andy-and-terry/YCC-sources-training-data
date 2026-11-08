(module
  (func $sum_to (export "sum_to") (param $n i32) (result i32)
    (i32.shr_u
      (i32.mul (local.get $n) (i32.add (local.get $n) (i32.const 1)))
      (i32.const 1))))
