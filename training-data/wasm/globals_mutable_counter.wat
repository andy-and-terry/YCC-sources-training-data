(module
  (global $count (mut i32) (i32.const 0))
  (global $step i32 (i32.const 5))
  (func (export "tick") (result i32)
    (global.set $count (i32.add (global.get $count) (global.get $step)))
    (global.get $count))
  (func (export "reset") (global.set $count (i32.const 0)))
  (export "count" (global $count)))
