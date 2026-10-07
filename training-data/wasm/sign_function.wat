(module
  ;; returns -1, 0 or 1
  (func $sign (export "sign") (param $x i32) (result i32)
    (i32.sub
      (i32.gt_s (local.get $x) (i32.const 0))
      (i32.lt_s (local.get $x) (i32.const 0))))

  (func $sign_f64 (export "sign_f64") (param $x f64) (result i32)
    (i32.sub
      (f64.gt (local.get $x) (f64.const 0))
      (f64.lt (local.get $x) (f64.const 0))))

  (func $same_sign (export "same_sign") (param $a i32) (param $b i32) (result i32)
    (i32.eq (call $sign (local.get $a)) (call $sign (local.get $b))))

  (func $copysign_demo (export "copysign_demo") (param $mag f64) (param $s f64) (result f64)
    (f64.copysign (local.get $mag) (local.get $s)))
)
