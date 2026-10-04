(module
  (func $sign (export "sign") (param $x i32) (result i32)
    (i32.sub
      (i32.gt_s (local.get $x) (i32.const 0))
      (i32.lt_s (local.get $x) (i32.const 0))))

  (func (export "sign_f64") (param $x f64) (result f64)
    (f64.copysign (f64.const 1) (local.get $x)))

  (func (export "compare") (param $a i32) (param $b i32) (result i32)
    (call $sign (i32.sub (local.get $a) (local.get $b))))
)
