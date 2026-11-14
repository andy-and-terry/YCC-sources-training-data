(module
  (type $binop (func (param i32 i32) (result i32)))
  (table 2 funcref)
  (elem (i32.const 0) $add $mul)
  (func $add (type $binop) (i32.add (local.get 0) (local.get 1)))
  (func $mul (type $binop) (i32.mul (local.get 0) (local.get 1)))
  (func (export "apply") (param $op i32) (param $a i32) (param $b i32) (result i32)
    (call_indirect (type $binop) (local.get $a) (local.get $b) (local.get $op))))
