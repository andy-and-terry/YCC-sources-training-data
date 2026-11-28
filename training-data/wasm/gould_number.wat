(module
  (func (export "gould") (param $n i32) (result i32)
    (i32.shl (i32.const 1) (i32.popcnt (local.get $n))))
)
