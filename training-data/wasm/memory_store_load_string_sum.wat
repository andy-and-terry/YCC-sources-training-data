(module
  (memory (export "mem") 1)
  (data (i32.const 0) "\01\02\03\04\05")

  (func (export "sum_bytes") (param $len i32) (result i32)
    (local $i i32)
    (local $s i32)
    (block $exit
      (loop $next
        (br_if $exit (i32.ge_u (local.get $i) (local.get $len)))
        (local.set $s (i32.add (local.get $s) (i32.load8_u (local.get $i))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (local.get $s))
)
