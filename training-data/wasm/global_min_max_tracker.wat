(module
  (global $min_val (mut i32) (i32.const 2147483647))
  (global $max_val (mut i32) (i32.const -2147483648))

  (func $update_min (export "update_min") (param $value i32)
    (if (i32.lt_s (local.get $value) (global.get $min_val))
      (then (global.set $min_val (local.get $value)))))

  (func $update_max (export "update_max") (param $value i32)
    (if (i32.gt_s (local.get $value) (global.get $max_val))
      (then (global.set $max_val (local.get $value)))))

  (func $track_value (export "track_value") (param $value i32)
    (call $update_min (local.get $value))
    (call $update_max (local.get $value)))

  (func $get_min (export "get_min") (result i32) (global.get $min_val))
  (func $get_max (export "get_max") (result i32) (global.get $max_val))
)
