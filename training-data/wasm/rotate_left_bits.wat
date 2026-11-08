(module
  (func $rotl (export "rotl") (param $x i32) (param $k i32) (result i32)
    (i32.rotl (local.get $x) (local.get $k))))
