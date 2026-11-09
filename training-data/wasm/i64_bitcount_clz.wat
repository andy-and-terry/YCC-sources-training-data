(module
  (func (export "clz32") (param i32) (result i32) (i32.clz (local.get 0)))
  (func (export "popcnt32") (param i32) (result i32) (i32.popcnt (local.get 0)))
  (func (export "ctz32") (param i32) (result i32) (i32.ctz (local.get 0))))
