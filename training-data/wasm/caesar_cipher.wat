(module
  (memory (export "memory") 1)

  (func $shift_char (export "shift_char") (param $c i32) (param $key i32) (result i32)
    (local $letter_base i32)
    (local $offset i32)
    (if (result i32) (i32.and (i32.ge_s (local.get $c) (i32.const 97)) (i32.le_s (local.get $c) (i32.const 122)))
      (then
        (local.set $letter_base (i32.const 97))
        (local.set $offset (i32.rem_s (i32.add (i32.sub (local.get $c) (local.get $letter_base)) (local.get $key)) (i32.const 26)))
        (i32.add (local.get $letter_base) (local.get $offset)))
      (else
        (if (result i32) (i32.and (i32.ge_s (local.get $c) (i32.const 65)) (i32.le_s (local.get $c) (i32.const 90)))
          (then
            (local.set $letter_base (i32.const 65))
            (local.set $offset (i32.rem_s (i32.add (i32.sub (local.get $c) (local.get $letter_base)) (local.get $key)) (i32.const 26)))
            (i32.add (local.get $letter_base) (local.get $offset)))
          (else (local.get $c))))))

  (func $caesar_encrypt (export "caesar_encrypt") (param $base i32) (param $len i32) (param $key i32)
    (local $i i32)
    (local $addr i32)
    (local.set $i (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $i) (local.get $len)))
        (local.set $addr (i32.add (local.get $base) (local.get $i)))
        (i32.store8 (local.get $addr) (call $shift_char (i32.load8_u (local.get $addr)) (local.get $key)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop))))
)
