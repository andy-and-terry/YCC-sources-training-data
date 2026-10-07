(module
  (memory (export "memory") 1)

  ;; Count byte values from data[0..n) into 256 i32 buckets at address 1024
  (func (export "histogram") (param $n i32)
    (local $i i32)
    (local $slot i32)
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (local.set $slot
          (i32.add
            (i32.const 1024)
            (i32.shl (i32.load8_u (local.get $i)) (i32.const 2))))
        (i32.store (local.get $slot)
          (i32.add (i32.load (local.get $slot)) (i32.const 1)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next))))

  (func (export "bucket") (param $value i32) (result i32)
    (i32.load (i32.add (i32.const 1024) (i32.shl (local.get $value) (i32.const 2)))))

  (func (export "poke") (param $addr i32) (param $v i32)
    (i32.store8 (local.get $addr) (local.get $v)))
)
