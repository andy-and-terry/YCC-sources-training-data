(module
  ;; Returns 1 if the number of set bits is odd.
  (func $parity (export "parity") (param $x i32) (result i32)
    (i32.and (i32.popcnt (local.get $x)) (i32.const 1))))
