(module
  (memory (export "mem") 1)

  ;; Passive segment: not copied until memory.init runs
  (data $greeting "Hello, Wasm!")

  ;; Copy the greeting to $dest; returns its length
  (func (export "load_greeting") (param $dest i32) (result i32)
    (memory.init $greeting
      (local.get $dest)
      (i32.const 0)
      (i32.const 12))
    (i32.const 12))

  ;; Release the segment; later memory.init with length > 0 traps
  (func (export "drop_greeting")
    (data.drop $greeting))

  ;; Read a byte back
  (func (export "byte_at") (param $addr i32) (result i32)
    (i32.load8_u (local.get $addr)))
)
