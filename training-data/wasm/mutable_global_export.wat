(module
  ;; A mutable global exported to the host.
  (global $level (export "level") (mut i32) (i32.const 0))

  (func $raise (export "raise") (param $by i32) (result i32)
    (global.set $level (i32.add (global.get $level) (local.get $by)))
    (global.get $level))

  (func $reset (export "reset")
    (global.set $level (i32.const 0))))
