(module
  (type $binop (func (param i32 i32) (result i32)))
  (func $add (type $binop) (i32.add (local.get 0) (local.get 1)))
  (func $sub (type $binop) (i32.sub (local.get 0) (local.get 1)))
  (table 2 funcref)
  (elem (i32.const 0) $add $sub)
  (func (export "apply") (param $op i32) (param $a i32) (param $b i32) (result i32)
    (call_indirect (type $binop) (local.get $a) (local.get $b) (local.get $op))))
