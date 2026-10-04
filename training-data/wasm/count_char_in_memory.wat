(module
  (memory (export "memory") 1)
  (data (i32.const 0) "mississippi river")

  ;; count occurrences of byte $ch in memory[0 .. len)
  (func $count_char (export "count_char") (param $len i32) (param $ch i32) (result i32)
    (local $i i32)
    (local $count i32)
    (block $done
      (loop $scan
        (br_if $done (i32.ge_u (local.get $i) (local.get $len)))
        (if (i32.eq (i32.load8_u (local.get $i)) (local.get $ch))
          (then (local.set $count (i32.add (local.get $count) (i32.const 1)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $scan)))
    (local.get $count))

  (func $count_s (export "count_s") (result i32)
    (call $count_char (i32.const 17) (i32.const 115)))

  (func $first_index (export "first_index") (param $len i32) (param $ch i32) (result i32)
    (local $i i32)
    (block $found
      (loop $scan
        (br_if $found (i32.ge_u (local.get $i) (local.get $len)))
        (br_if $found (i32.eq (i32.load8_u (local.get $i)) (local.get $ch)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $scan)))
    (if (result i32) (i32.ge_u (local.get $i) (local.get $len))
      (then (i32.const -1))
      (else (local.get $i))))
)
