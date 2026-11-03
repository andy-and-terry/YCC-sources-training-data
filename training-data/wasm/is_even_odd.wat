(module
  (func $is_even (export "is_even") (param $n i32) (result i32)
    (i32.eqz (i32.and (local.get $n) (i32.const 1))))
  (func $is_odd (export "is_odd") (param $n i32) (result i32)
    (i32.and (local.get $n) (i32.const 1))))
