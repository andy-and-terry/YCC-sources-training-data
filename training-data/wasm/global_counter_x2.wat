(module
  (global $c (mut i32) (i32.const 0))
  (func (export "inc") (result i32)
    (global.set $c (i32.add (global.get $c) (i32.const 1)))
    (global.get $c)))
