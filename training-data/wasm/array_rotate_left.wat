(module
  (memory (export "memory") 1)

  (func $array_rotate_left (export "array_rotate_left")
        (param $base i32) (param $temp_base i32) (param $len i32) (param $k i32)
    (local $i i32)
    (local $src i32)
    (local.set $i (i32.const 0))
    (block $done1
      (loop $loop1
        (br_if $done1 (i32.ge_s (local.get $i) (local.get $len)))
        (local.set $src (i32.rem_s (i32.add (local.get $i) (local.get $k)) (local.get $len)))
        (i32.store
          (i32.add (local.get $temp_base) (i32.mul (local.get $i) (i32.const 4)))
          (i32.load (i32.add (local.get $base) (i32.mul (local.get $src) (i32.const 4)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop1)))
    (local.set $i (i32.const 0))
    (block $done2
      (loop $loop2
        (br_if $done2 (i32.ge_s (local.get $i) (local.get $len)))
        (i32.store
          (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4)))
          (i32.load (i32.add (local.get $temp_base) (i32.mul (local.get $i) (i32.const 4)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop2))))
)
