(module
  (memory (export "mem") 1)
  (func (export "roundtrip") (param i32) (result i32)
    (i32.store (i32.const 0) (local.get 0))
    (i32.load8_u (i32.const 1))))
