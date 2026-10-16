(module
  (memory (export "memory") 1)
  (data (i32.const 0) "12345\00")
  (data (i32.const 16) "12a45\00")

  ;; Returns 1 if the NUL-terminated string at ptr is non-empty and all ASCII digits.
  (func $all_digits (export "all_digits") (param $ptr i32) (result i32)
    (local $c i32) (local $start i32)
    (local.set $start (local.get $ptr))
    (loop $l
      (local.set $c (i32.load8_u (local.get $ptr)))
      (if (i32.eqz (local.get $c))
        (then (return (i32.ne (local.get $ptr) (local.get $start)))))
      (if (i32.gt_u (i32.sub (local.get $c) (i32.const 48)) (i32.const 9))
        (then (return (i32.const 0))))
      (local.set $ptr (i32.add (local.get $ptr) (i32.const 1)))
      (br $l))
    (i32.const 0)))
