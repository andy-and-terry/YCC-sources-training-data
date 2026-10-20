(module
  (memory (export "mem") 1)
  (data (i32.const 0) "Hello, WebAssembly\00")
  (func (export "strlen") (param $p i32) (result i32)
    (local $n i32)
    (loop $l
      (if (i32.load8_u (i32.add (local.get $p) (local.get $n)))
        (then (local.set $n (i32.add (local.get $n) (i32.const 1))) (br $l))))
    (local.get $n))
  (func (export "count_char") (param $p i32) (param $c i32) (result i32)
    (local $n i32) (local $ch i32)
    (loop $l
      (local.set $ch (i32.load8_u (local.get $p)))
      (if (local.get $ch)
        (then
          (if (i32.eq (local.get $ch) (local.get $c)) (then (local.set $n (i32.add (local.get $n) (i32.const 1)))))
          (local.set $p (i32.add (local.get $p) (i32.const 1)))
          (br $l))))
    (local.get $n)))
