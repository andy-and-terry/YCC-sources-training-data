(module
  (memory (export "memory") 1)
  (func $count_nonzero (export "count_nonzero") (param $ptr i32) (param $len i32) (result i32)
    (local $c i32)
    (block $done
      (loop $l
        (br_if $done (i32.eqz (local.get $len)))
        (if (i32.load8_u (local.get $ptr))
          (then (local.set $c (i32.add (local.get $c) (i32.const 1)))))
        (local.set $ptr (i32.add (local.get $ptr) (i32.const 1)))
        (local.set $len (i32.sub (local.get $len) (i32.const 1)))
        (br $l)))
    (local.get $c)))
