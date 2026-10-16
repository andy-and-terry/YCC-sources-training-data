(module
  (type $unary (func (param i32) (result i32)))
  (table $ops 3 funcref)
  (elem (table $ops) (i32.const 0) func $negate $square $half)

  (func $negate (type $unary) (i32.sub (i32.const 0) (local.get 0)))
  (func $square (type $unary) (i32.mul (local.get 0) (local.get 0)))
  (func $half   (type $unary) (i32.shr_s (local.get 0) (i32.const 1)))

  (func $apply (export "apply") (param $op i32) (param $x i32) (result i32)
    (call_indirect $ops (type $unary) (local.get $x) (local.get $op))))
