(module
  (global $initialized (mut i32) (i32.const 0))
  (global $magic (mut i32) (i32.const 0))

  ;; Runs automatically at instantiation, before any export is called
  (func $init
    (global.set $magic (i32.const 42))
    (global.set $initialized (i32.const 1)))

  (start $init)

  (func (export "is_initialized") (result i32)
    (global.get $initialized))

  (func (export "get_magic") (result i32)
    (global.get $magic))
)
