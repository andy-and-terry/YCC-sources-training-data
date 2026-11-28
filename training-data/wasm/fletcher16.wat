(module
  (memory (export "memory") 1)
  (data (i32.const 0) "abcde")

  (func (export "fletcher16") (param $ptr i32) (param $len i32) (result i32)
    (local $s1 i32) (local $s2 i32) (local $i i32)
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $i) (local.get $len)))
        (local.set $s1 (i32.rem_u
          (i32.add (local.get $s1) (i32.load8_u (i32.add (local.get $ptr) (local.get $i))))
          (i32.const 255)))
        (local.set $s2 (i32.rem_u (i32.add (local.get $s2) (local.get $s1)) (i32.const 255)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (i32.or (i32.shl (local.get $s2) (i32.const 8)) (local.get $s1)))
)
