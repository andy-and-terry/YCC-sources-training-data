(module
  (type $binop (func (param i32 i32) (result i32)))
  (func $add (type $binop) (i32.add (local.get 0) (local.get 1)))
  (func $sub (type $binop) (i32.sub (local.get 0) (local.get 1)))
  (func $mul (type $binop) (i32.mul (local.get 0) (local.get 1)))
  (table $ops funcref (elem $add $sub $mul))
  (func (export "apply") (param $op i32) (param $a i32) (param $b i32) (result i32)
    (call_indirect $ops (type $binop) (local.get $a) (local.get $b) (local.get $op))))
