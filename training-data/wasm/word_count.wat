(module
  (memory (export "memory") 1)

  (func $word_count (export "word_count") (param $base i32) (param $len i32) (result i32)
    (local $i i32)
    (local $in_word i32)
    (local $count i32)
    (local $c i32)
    (local.set $i (i32.const 0))
    (local.set $in_word (i32.const 0))
    (local.set $count (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $i) (local.get $len)))
        (local.set $c (i32.load8_u (i32.add (local.get $base) (local.get $i))))
        (if (i32.eq (local.get $c) (i32.const 32))
          (then (local.set $in_word (i32.const 0)))
          (else
            (if (i32.eqz (local.get $in_word))
              (then
                (local.set $in_word (i32.const 1))
                (local.set $count (i32.add (local.get $count) (i32.const 1)))))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop)))
    (local.get $count))
)
