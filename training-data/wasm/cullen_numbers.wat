(module
  (func (export "cullen") (param $n i64) (result i64)
    (i64.add
      (i64.mul (local.get $n) (i64.shl (i64.const 1) (local.get $n)))
      (i64.const 1)))
)
