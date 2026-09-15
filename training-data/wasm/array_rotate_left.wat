(module
  (memory (export "memory") 1)

  (func $array_rotate_left (export "array_rotate_left")
        (param $base i32) (param $len i32) (param $k i32) (param $scratch i32)
    (local $i i32)
    (local.set $i (i32.const 0))
    (block $save_done
      (loop $save
        (br_if $save_done (i32.ge_s (local.get $i) (local.get $k)))
        (i32.store (i32.add (local.get $scratch) (i32.mul (local.get $i) (i32.const 4)))
                   (i32.load (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $save)))
    (local.set $i (i32.const 0))
    (block $shift_done
      (loop $shift
        (br_if $shift_done (i32.ge_s (local.get $i) (i32.sub (local.get $len) (local.get $k))))
        (i32.store (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4)))
                   (i32.load (i32.add (local.get $base) (i32.mul (i32.add (local.get $i) (local.get $k)) (i32.const 4)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $shift)))
    (local.set $i (i32.const 0))
    (block $restore_done
      (loop $restore
        (br_if $restore_done (i32.ge_s (local.get $i) (local.get $k)))
        (i32.store (i32.add (local.get $base) (i32.mul (i32.add (i32.sub (local.get $len) (local.get $k)) (local.get $i)) (i32.const 4)))
                   (i32.load (i32.add (local.get $scratch) (i32.mul (local.get $i) (i32.const 4)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $restore))))
)
