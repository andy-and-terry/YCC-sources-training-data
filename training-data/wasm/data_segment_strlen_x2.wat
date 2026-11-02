(module
  (memory 1)
  (data (i32.const 0) "hello\00")
  (func (export "len") (result i32)
    (local $i i32)
    (block $b (loop $l
      (br_if $b (i32.eqz (i32.load8_u (local.get $i))))
      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br $l)))
    (local.get $i)))
