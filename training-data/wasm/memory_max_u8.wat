(module
  (memory (export "memory") 1)
  (data (i32.const 0) "\05\2a\11\c8\63\07")

  (func $max_u8 (export "max_u8") (param $ptr i32) (param $len i32) (result i32)
    (local $i i32) (local $m i32) (local $v i32)
    (block $done
      (loop $l
        (br_if $done (i32.ge_u (local.get $i) (local.get $len)))
        (local.set $v (i32.load8_u (i32.add (local.get $ptr) (local.get $i))))
        (if (i32.gt_u (local.get $v) (local.get $m))
          (then (local.set $m (local.get $v))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $l)))
    (local.get $m)))
