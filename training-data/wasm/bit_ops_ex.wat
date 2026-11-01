(module
  (func (export "popcnt") (param i32) (result i32) (i32.popcnt (local.get 0)))
  (func (export "clz") (param i32) (result i32) (i32.clz (local.get 0)))
  (func (export "rotl8") (param i32) (result i32) (i32.rotl (local.get 0) (i32.const 8)))
  (func (export "is_pow2") (param $x i32) (result i32)
    (i32.and
      (i32.ne (local.get $x) (i32.const 0))
      (i32.eqz (i32.and (local.get $x) (i32.sub (local.get $x) (i32.const 1)))))))
