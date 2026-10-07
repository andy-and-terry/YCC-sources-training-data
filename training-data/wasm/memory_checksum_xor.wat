(module
  (memory (export "memory") 1)
  (data (i32.const 0) "checksum me")

  ;; XOR of all bytes in [ptr, ptr+len)
  (func $xor_checksum (export "xor_checksum") (param $ptr i32) (param $len i32) (result i32)
    (local $acc i32)
    (local $end i32)
    (local.set $end (i32.add (local.get $ptr) (local.get $len)))
    (block $exit
      (loop $loop
        (br_if $exit (i32.ge_u (local.get $ptr) (local.get $end)))
        (local.set $acc (i32.xor (local.get $acc) (i32.load8_u (local.get $ptr))))
        (local.set $ptr (i32.add (local.get $ptr) (i32.const 1)))
        (br $loop)))
    (local.get $acc))

  ;; Fletcher-16 style running sums
  (func $fletcher16 (export "fletcher16") (param $ptr i32) (param $len i32) (result i32)
    (local $s1 i32)
    (local $s2 i32)
    (local $i i32)
    (block $exit
      (loop $loop
        (br_if $exit (i32.ge_u (local.get $i) (local.get $len)))
        (local.set $s1
          (i32.rem_u
            (i32.add (local.get $s1) (i32.load8_u (i32.add (local.get $ptr) (local.get $i))))
            (i32.const 255)))
        (local.set $s2 (i32.rem_u (i32.add (local.get $s2) (local.get $s1)) (i32.const 255)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop)))
    (i32.or (i32.shl (local.get $s2) (i32.const 8)) (local.get $s1)))

  (func $demo (export "demo") (result i32)
    (call $xor_checksum (i32.const 0) (i32.const 11)))
)
