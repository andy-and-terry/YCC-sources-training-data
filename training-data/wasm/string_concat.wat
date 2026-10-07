(module
  (memory (export "memory") 1)

  (func $copy_bytes (export "copy_bytes") (param $src i32) (param $dst i32) (param $len i32)
    (local $i i32)
    (local.set $i (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $i) (local.get $len)))
        (i32.store8 (i32.add (local.get $dst) (local.get $i)) (i32.load8_u (i32.add (local.get $src) (local.get $i))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop))))

  (func $string_concat (export "string_concat")
        (param $a_base i32) (param $a_len i32) (param $b_base i32) (param $b_len i32) (param $dest_base i32) (result i32)
    (call $copy_bytes (local.get $a_base) (local.get $dest_base) (local.get $a_len))
    (call $copy_bytes (local.get $b_base) (i32.add (local.get $dest_base) (local.get $a_len)) (local.get $b_len))
    (i32.add (local.get $a_len) (local.get $b_len)))
)
