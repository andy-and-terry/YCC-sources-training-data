(module
  (memory (export "memory") 1)

  ;; Fill len i32 slots starting at byte offset base with value.
  (func $fill (export "fill") (param $base i32) (param $len i32) (param $value i32)
    (local $i i32)
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $i) (local.get $len)))
        (i32.store
          (i32.add (local.get $base) (i32.shl (local.get $i) (i32.const 2)))
          (local.get $value))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next))))

  (func $get (export "get") (param $base i32) (param $i i32) (result i32)
    (i32.load (i32.add (local.get $base) (i32.shl (local.get $i) (i32.const 2)))))
)
