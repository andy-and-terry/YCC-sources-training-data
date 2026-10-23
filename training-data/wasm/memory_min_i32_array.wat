(module
  (memory (export "memory") 1)
  (data (i32.const 0) "\09\00\00\00\02\00\00\00\07\00\00\00\ff\ff\ff\ff\05\00\00\00")

  ;; smallest signed i32 in an array of `len` elements (len > 0)
  (func $min (export "min") (param $ptr i32) (param $len i32) (result i32)
    (local $i i32) (local $best i32) (local $v i32)
    (local.set $best (i32.load (local.get $ptr)))
    (local.set $i (i32.const 1))
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $i) (local.get $len)))
        (local.set $v
          (i32.load (i32.add (local.get $ptr) (i32.shl (local.get $i) (i32.const 2)))))
        (if (i32.lt_s (local.get $v) (local.get $best))
          (then (local.set $best (local.get $v))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (local.get $best))

  (func (export "test") (result i32)
    (call $min (i32.const 0) (i32.const 5)))   ;; -1
)
