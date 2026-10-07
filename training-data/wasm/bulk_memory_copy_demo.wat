(module
  (memory (export "memory") 1)

  (func $fill_region (export "fill_region") (param $addr i32) (param $len i32) (param $value i32)
    (memory.fill (local.get $addr) (local.get $value) (local.get $len)))

  (func $copy_region (export "copy_region") (param $dst i32) (param $src i32) (param $len i32)
    (memory.copy (local.get $dst) (local.get $src) (local.get $len)))
)
