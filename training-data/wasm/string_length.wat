(module
  (memory (export "memory") 1)

  (func $string_length (export "string_length") (param $ptr i32) (result i32)
    (local $len i32)
    (local.set $len (i32.const 0))
    (block $done
      (loop $count
        (br_if $done (i32.eqz (i32.load8_u (i32.add (local.get $ptr) (local.get $len)))))
        (local.set $len (i32.add (local.get $len) (i32.const 1)))
        (br $count)))
    (local.get $len))
)
