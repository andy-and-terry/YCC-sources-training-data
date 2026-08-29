(module
  (type $binop_t (func (param i32 i32) (result i32)))
  (table 2 funcref)
  (elem (i32.const 0) $add_fn $sub_fn)

  (func $add_fn (param $a i32) (param $b i32) (result i32)
    (i32.add (local.get $a) (local.get $b)))

  (func $sub_fn (param $a i32) (param $b i32) (result i32)
    (i32.sub (local.get $a) (local.get $b)))

  (func $apply (export "apply") (param $idx i32) (param $a i32) (param $b i32) (result i32)
    (call_indirect (type $binop_t) (local.get $a) (local.get $b) (local.get $idx)))
)
