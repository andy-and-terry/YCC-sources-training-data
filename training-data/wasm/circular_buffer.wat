(module
  (memory (export "memory") 1)
  (global $start (mut i32) (i32.const 0))
  (global $size (mut i32) (i32.const 0))
  (global $capacity (mut i32) (i32.const 3))

  (func $push (export "push") (param $data_base i32) (param $value i32)
    (local $index i32)
    (local.set $index (i32.rem_s (i32.add (global.get $start) (global.get $size)) (global.get $capacity)))
    (i32.store (i32.add (local.get $data_base) (i32.mul (local.get $index) (i32.const 4))) (local.get $value))
    (if (i32.lt_s (global.get $size) (global.get $capacity))
      (then (global.set $size (i32.add (global.get $size) (i32.const 1))))
      (else (global.set $start (i32.rem_s (i32.add (global.get $start) (i32.const 1)) (global.get $capacity))))))

  (func $get_start (export "get_start") (result i32) (global.get $start))
  (func $get_size (export "get_size") (result i32) (global.get $size))
)
