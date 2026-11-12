(module
  (func (export "pop") (param i32) (result i32) (i32.popcnt (local.get 0)))
  (func (export "clz") (param i32) (result i32) (i32.clz (local.get 0)))
  (func (export "rotl") (param i32 i32) (result i32) (i32.rotl (local.get 0) (local.get 1))))
