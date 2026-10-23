(module
  (memory (export "memory") 1)
  (data (i32.const 0) "hello, wasm\00")

  ;; returns number of bytes before the first zero byte
  (func $strlen (export "strlen") (param $ptr i32) (result i32)
    (local $n i32)
    (block $done
      (loop $next
        (br_if $done
          (i32.eqz (i32.load8_u (i32.add (local.get $ptr) (local.get $n)))))
        (local.set $n (i32.add (local.get $n) (i32.const 1)))
        (br $next)))
    (local.get $n))

  (func (export "test") (result i32)
    (call $strlen (i32.const 0)))
)
