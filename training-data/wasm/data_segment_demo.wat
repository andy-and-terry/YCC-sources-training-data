(module
  (memory (export "memory") 1)
  (data (i32.const 0) "Hello, Wasm!")

  (func $get_ptr (export "get_ptr") (result i32)
    (i32.const 0))

  (func $get_length (export "get_length") (result i32)
    (i32.const 12))

  (func $char_at (export "char_at") (param $idx i32) (result i32)
    (i32.load8_u (i32.add (i32.const 0) (local.get $idx))))
)
