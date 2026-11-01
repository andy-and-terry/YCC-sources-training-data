(module
  (memory (export "mem") 1)
  (func (export "sum") (param $ptr i32) (param $len i32) (result i32)
    (local $s i32)
    (block $out
      (loop $l
        (br_if $out (i32.eqz (local.get $len)))
        (local.set $s (i32.add (local.get $s) (i32.load (local.get $ptr))))
        (local.set $ptr (i32.add (local.get $ptr) (i32.const 4)))
        (local.set $len (i32.sub (local.get $len) (i32.const 1)))
        (br $l)))
    (local.get $s)))
