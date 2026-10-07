(module
  (memory (export "memory") 1)

  (func $copy_region (export "copy_region") (param $src i32) (param $dst i32) (param $len i32)
    (memory.copy (local.get $dst) (local.get $src) (local.get $len)))

  (func $fill_region (export "fill_region") (param $dst i32) (param $value i32) (param $len i32)
    (memory.fill (local.get $dst) (local.get $value) (local.get $len)))
)
