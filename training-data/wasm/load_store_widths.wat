(module
  (memory (export "memory") 1)
  (data (i32.const 0) "\ff\fe\01\80")

  (func (export "load8_u") (param $addr i32) (result i32)
    (i32.load8_u (local.get $addr)))

  (func (export "load8_s") (param $addr i32) (result i32)
    (i32.load8_s (local.get $addr)))

  (func (export "load16_u") (param $addr i32) (result i32)
    (i32.load16_u (local.get $addr)))

  (func (export "load16_s") (param $addr i32) (result i32)
    (i32.load16_s (local.get $addr)))

  ;; Store only the low 8 bits of a value
  (func (export "store8") (param $addr i32) (param $v i32)
    (i32.store8 (local.get $addr) (local.get $v)))

  ;; Load with a static offset immediate
  (func (export "load_offset2") (result i32)
    (i32.load16_u offset=2 (i32.const 0)))
)
