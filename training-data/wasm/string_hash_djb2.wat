(module
  (memory (export "memory") 1)
  (data (i32.const 0) "webassembly\00")

  ;; djb2: h = h * 33 + c, starting at 5381
  (func $djb2 (export "djb2") (param $ptr i32) (result i32)
    (local $h i32) (local $c i32)
    (local.set $h (i32.const 5381))
    (loop $l
      (local.set $c (i32.load8_u (local.get $ptr)))
      (if (local.get $c)
        (then
          (local.set $h
            (i32.add (i32.mul (local.get $h) (i32.const 33)) (local.get $c)))
          (local.set $ptr (i32.add (local.get $ptr) (i32.const 1)))
          (br $l))))
    (local.get $h)))
