(module
  (global $ready (mut i32) (i32.const 0))
  (func $init (global.set $ready (i32.const 1)))
  (start $init)
  (func (export "isReady") (result i32) (global.get $ready)))
