(module
  (memory (export "mem") 1)
  (data (i32.const 16) "Hello, wasm")
  (func (export "len") (result i32) (i32.const 11)))
