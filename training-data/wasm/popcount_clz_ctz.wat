(module
  (func (export "popcount") (param $x i32) (result i32)
    (i32.popcnt (local.get $x)))

  (func (export "leading_zeros") (param $x i32) (result i32)
    (i32.clz (local.get $x)))

  (func (export "trailing_zeros") (param $x i32) (result i32)
    (i32.ctz (local.get $x)))

  ;; floor(log2(x)) for x > 0
  (func (export "log2_floor") (param $x i32) (result i32)
    (i32.sub (i32.const 31) (i32.clz (local.get $x))))
)
