(module
  (memory (export "memory") 1)

  ;; Demonstrates the bulk-memory memory.fill and memory.copy instructions:
  ;; fill sets a whole region to one byte value, and copy duplicates a
  ;; source region elsewhere, both in a single instruction rather than the
  ;; byte-at-a-time loops used by string_reverse_memory.wat and friends.
  (func $fill_region (export "fill_region") (param $dest i32) (param $value i32) (param $len i32)
    (memory.fill (local.get $dest) (local.get $value) (local.get $len)))

  (func $copy_region (export "copy_region") (param $dest i32) (param $src i32) (param $len i32)
    (memory.copy (local.get $dest) (local.get $src) (local.get $len)))
)
