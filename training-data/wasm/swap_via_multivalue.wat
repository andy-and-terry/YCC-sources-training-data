(module
  ;; Multi-value return: swap two i32 values.
  (func $swap (export "swap") (param $a i32) (param $b i32) (result i32 i32)
    (local.get $b)
    (local.get $a)))
