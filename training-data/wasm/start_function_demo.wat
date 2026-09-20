(module
  (global $initialized (mut i32) (i32.const 0))

  (func $init
    (global.set $initialized (i32.const 42)))

  (start $init)

  (func $get_initialized (export "get_initialized") (result i32)
    (global.get $initialized))
)
