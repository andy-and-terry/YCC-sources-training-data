(module
  (memory (export "memory") 1)

  (func $string_equals (export "string_equals") (param $a i32) (param $b i32) (param $len i32) (result i32)
    (local $i i32)
    (local.set $i (i32.const 0))
    (block $done (result i32)
      (loop $loop (result i32)
        (if (result i32) (i32.ge_s (local.get $i) (local.get $len))
          (then (i32.const 1))
          (else
            (if (result i32) (i32.ne
                  (i32.load8_u (i32.add (local.get $a) (local.get $i)))
                  (i32.load8_u (i32.add (local.get $b) (local.get $i))))
              (then (i32.const 0))
              (else
                (local.set $i (i32.add (local.get $i) (i32.const 1)))
                (br $loop)))))))
  )
)
