(module
  (memory (export "memory") 1)
  (data (i32.const 0) "find the needle\00")

  ;; index of first occurrence of $ch in NUL-terminated string at $ptr, or -1
  (func $find_char (export "find_char") (param $ptr i32) (param $ch i32) (result i32)
    (local $i i32)
    (local $c i32)
    (block $not_found
      (loop $scan
        (local.set $c (i32.load8_u (i32.add (local.get $ptr) (local.get $i))))
        (br_if $not_found (i32.eqz (local.get $c)))
        (if (i32.eq (local.get $c) (local.get $ch))
          (then (return (local.get $i))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $scan)))
    (i32.const -1))

  (func $count_char (export "count_char") (param $ptr i32) (param $ch i32) (result i32)
    (local $n i32)
    (local $c i32)
    (block $end
      (loop $scan
        (local.set $c (i32.load8_u (local.get $ptr)))
        (br_if $end (i32.eqz (local.get $c)))
        (local.set $n (i32.add (local.get $n) (i32.eq (local.get $c) (local.get $ch))))
        (local.set $ptr (i32.add (local.get $ptr) (i32.const 1)))
        (br $scan)))
    (local.get $n))

  (func $demo (export "demo") (result i32)
    (call $find_char (i32.const 0) (i32.const 110)))
)
