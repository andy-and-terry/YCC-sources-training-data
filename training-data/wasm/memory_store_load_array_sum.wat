(module
  (memory (export "mem") 1)
  (func (export "fill") (param $n i32)
    (local $i i32)
    (loop $l
      (i32.store (i32.mul (local.get $i) (i32.const 4)) (i32.mul (local.get $i) (local.get $i)))
      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br_if $l (i32.lt_u (local.get $i) (local.get $n)))))
  (func (export "sum") (param $n i32) (result i32)
    (local $i i32) (local $s i32)
    (loop $l
      (local.set $s (i32.add (local.get $s) (i32.load (i32.mul (local.get $i) (i32.const 4)))))
      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br_if $l (i32.lt_u (local.get $i) (local.get $n))))
    (local.get $s)))
