(module
  (memory (export "mem") 1)
  (func (export "store_load") (param $v i32) (result i32)
    (i32.store (i32.const 0) (local.get $v))
    (i32.store8 (i32.const 8) (i32.const 255))
    (i32.add (i32.load (i32.const 0)) (i32.load8_u (i32.const 8)))))
