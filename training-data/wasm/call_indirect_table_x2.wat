(module
  (type $bin (func (param i32 i32) (result i32)))
  (table 2 funcref)
  (func $add (type $bin) (i32.add (local.get 0) (local.get 1)))
  (func $mul (type $bin) (i32.mul (local.get 0) (local.get 1)))
  (elem (i32.const 0) $add $mul)
  (func (export "apply") (param i32 i32 i32) (result i32)
    (call_indirect (type $bin) (local.get 1) (local.get 2) (local.get 0))))
