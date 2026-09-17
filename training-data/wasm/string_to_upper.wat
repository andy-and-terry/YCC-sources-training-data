(module
  (memory (export "memory") 1)

  (func $string_to_upper (export "string_to_upper") (param $base i32) (param $len i32)
    (local $i i32)
    (local $c i32)
    (local.set $i (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $i) (local.get $len)))
        (local.set $c (i32.load8_u (i32.add (local.get $base) (local.get $i))))
        (if (i32.and (i32.ge_s (local.get $c) (i32.const 97)) (i32.le_s (local.get $c) (i32.const 122)))
          (then
            (i32.store8 (i32.add (local.get $base) (local.get $i)) (i32.sub (local.get $c) (i32.const 32)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop))))
)
