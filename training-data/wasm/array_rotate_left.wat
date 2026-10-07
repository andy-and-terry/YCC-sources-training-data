(module
  (memory (export "memory") 1)

  (func $array_rotate_left (export "array_rotate_left")
        (param $base i32) (param $len i32) (param $k i32) (param $temp_base i32)
    (local $i i32)
    (local $shift i32)
    (local $src i32)
    (local.set $shift (i32.rem_s (local.get $k) (local.get $len)))
    (local.set $i (i32.const 0))
    (block $copy_done
      (loop $copy_loop
        (br_if $copy_done (i32.ge_s (local.get $i) (local.get $len)))
        (local.set $src (i32.rem_s (i32.add (local.get $i) (local.get $shift)) (local.get $len)))
        (i32.store (i32.add (local.get $temp_base) (i32.mul (local.get $i) (i32.const 4)))
          (i32.load (i32.add (local.get $base) (i32.mul (local.get $src) (i32.const 4)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $copy_loop)))
    (local.set $i (i32.const 0))
    (block $store_done
      (loop $store_loop
        (br_if $store_done (i32.ge_s (local.get $i) (local.get $len)))
        (i32.store (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4)))
          (i32.load (i32.add (local.get $temp_base) (i32.mul (local.get $i) (i32.const 4)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $store_loop))))
)
