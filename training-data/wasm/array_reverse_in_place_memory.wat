(module
  (memory (export "memory") 1)
  (data (i32.const 0) "\01\00\00\00\02\00\00\00\03\00\00\00\04\00\00\00\05\00\00\00")

  ;; reverses `len` i32 values starting at byte address `ptr`
  (func $reverse (export "reverse") (param $ptr i32) (param $len i32)
    (local $i i32) (local $j i32) (local $tmp i32)
    (local.set $j (i32.sub (local.get $len) (i32.const 1)))
    (block $done
      (loop $swap
        (br_if $done (i32.ge_s (local.get $i) (local.get $j)))
        (local.set $tmp
          (i32.load (i32.add (local.get $ptr) (i32.shl (local.get $i) (i32.const 2)))))
        (i32.store (i32.add (local.get $ptr) (i32.shl (local.get $i) (i32.const 2)))
          (i32.load (i32.add (local.get $ptr) (i32.shl (local.get $j) (i32.const 2)))))
        (i32.store (i32.add (local.get $ptr) (i32.shl (local.get $j) (i32.const 2)))
          (local.get $tmp))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (local.set $j (i32.sub (local.get $j) (i32.const 1)))
        (br $swap))))

  ;; reverse the five values, then return the first one (5)
  (func (export "test") (result i32)
    (call $reverse (i32.const 0) (i32.const 5))
    (i32.load (i32.const 0)))
)
