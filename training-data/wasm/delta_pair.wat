(module
  (func $delta (export "delta") (param $prev i32) (param $cur i32) (result i32)
    (i32.sub (local.get $cur) (local.get $prev))))
