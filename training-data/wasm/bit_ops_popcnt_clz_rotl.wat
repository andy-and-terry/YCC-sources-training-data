(module
  (func (export "popcount") (param i32) (result i32) (i32.popcnt (local.get 0)))
  (func (export "leading_zeros") (param i32) (result i32) (i32.clz (local.get 0)))
  (func (export "trailing_zeros") (param i32) (result i32) (i32.ctz (local.get 0)))
  (func (export "rotl8") (param i32) (result i32) (i32.rotl (local.get 0) (i32.const 8)))
  (func (export "is_pow2") (param $x i32) (result i32)
    (i32.and (i32.ne (local.get $x) (i32.const 0))
             (i32.eqz (i32.and (local.get $x) (i32.sub (local.get $x) (i32.const 1))))))
  (func (export "swap_bytes") (param $x i32) (result i32)
    (i32.or
      (i32.or (i32.shl (i32.and (local.get $x) (i32.const 0xff)) (i32.const 24))
              (i32.shl (i32.and (local.get $x) (i32.const 0xff00)) (i32.const 8)))
      (i32.or (i32.and (i32.shr_u (local.get $x) (i32.const 8)) (i32.const 0xff00))
              (i32.shr_u (local.get $x) (i32.const 24))))))
