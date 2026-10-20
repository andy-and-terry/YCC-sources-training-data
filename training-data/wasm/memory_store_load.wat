(module
  (memory (export "mem") 1)
  (func (export "roundtrip") (param $v i32) (result i32)
    (i32.store (i32.const 0) (local.get $v))
    (i32.load (i32.const 0))))
