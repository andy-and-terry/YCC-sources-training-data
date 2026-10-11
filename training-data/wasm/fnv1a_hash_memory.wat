(module
  (memory (export "memory") 1)
  (data (i32.const 0) "hash me")

  ;; 32-bit FNV-1a over len bytes
  (func $fnv1a (export "fnv1a") (param $ptr i32) (param $len i32) (result i32)
    (local $h i32)
    (local.set $h (i32.const 0x811c9dc5))
    (block $done
      (loop $l
        (br_if $done (i32.eqz (local.get $len)))
        (local.set $h
          (i32.mul
            (i32.xor (local.get $h) (i32.load8_u (local.get $ptr)))
            (i32.const 0x01000193)))
        (local.set $ptr (i32.add (local.get $ptr) (i32.const 1)))
        (local.set $len (i32.sub (local.get $len) (i32.const 1)))
        (br $l)))
    (local.get $h)))
