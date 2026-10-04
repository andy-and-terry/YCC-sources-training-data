(module
  (memory (export "memory") 1)

  (func $store_word (export "store_word") (param $addr i32) (param $v i32)
    (i32.store (local.get $addr) (local.get $v)))

  (func $byte_u (export "byte_u") (param $addr i32) (result i32)
    (i32.load8_u (local.get $addr)))

  (func $byte_s (export "byte_s") (param $addr i32) (result i32)
    (i32.load8_s (local.get $addr)))

  (func $half_u (export "half_u") (param $addr i32) (result i32)
    (i32.load16_u (local.get $addr)))

  (func $half_s (export "half_s") (param $addr i32) (result i32)
    (i32.load16_s (local.get $addr)))

  (func $word_offset (export "word_offset") (param $addr i32) (result i32)
    (i32.load offset=4 (local.get $addr)))

  (func $store_bytes (export "store_bytes") (param $addr i32) (param $v i32)
    (i32.store8 (local.get $addr) (local.get $v))
    (i32.store8 offset=1 (local.get $addr) (i32.shr_u (local.get $v) (i32.const 8))))
)
