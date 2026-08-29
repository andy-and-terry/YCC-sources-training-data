(module
  (memory (export "memory") 1)

  (func $is_palindrome (export "is_palindrome") (param $base i32) (param $len i32) (result i32)
    (local $low i32)
    (local $high i32)
    (local.set $low (i32.const 0))
    (local.set $high (i32.sub (local.get $len) (i32.const 1)))
    (block $done (result i32)
      (loop $loop (result i32)
        (if (result i32) (i32.ge_s (local.get $low) (local.get $high))
          (then (i32.const 1))
          (else
            (if (result i32) (i32.ne
                  (i32.load8_u (i32.add (local.get $base) (local.get $low)))
                  (i32.load8_u (i32.add (local.get $base) (local.get $high))))
              (then (i32.const 0))
              (else
                (local.set $low (i32.add (local.get $low) (i32.const 1)))
                (local.set $high (i32.sub (local.get $high) (i32.const 1)))
                (br $loop)))))))
  )
)
