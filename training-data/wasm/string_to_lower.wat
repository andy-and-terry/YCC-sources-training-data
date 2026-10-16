(module
  (memory (export "memory") 1)
  (data (i32.const 0) "Hello WASM\00")

  (func $to_lower (export "to_lower") (param $ptr i32)
    (local $c i32)
    (loop $l
      (local.set $c (i32.load8_u (local.get $ptr)))
      (if (local.get $c)
        (then
          (if (i32.lt_u (i32.sub (local.get $c) (i32.const 65)) (i32.const 26))
            (then (i32.store8 (local.get $ptr) (i32.or (local.get $c) (i32.const 32)))))
          (local.set $ptr (i32.add (local.get $ptr) (i32.const 1)))
          (br $l))))))
