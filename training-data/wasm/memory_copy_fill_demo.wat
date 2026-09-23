(module
  (memory (export "memory") 1)

  ;; Bulk-memory instruction: fills `len` bytes starting at `dst` with the
  ;; low byte of `value`, without an explicit store loop.
  (func $fill_bytes (export "fill_bytes") (param $dst i32) (param $value i32) (param $len i32)
    (memory.fill (local.get $dst) (local.get $value) (local.get $len)))

  ;; Bulk-memory instruction: copies `len` bytes from `src` to `dst`.
  ;; memory.copy is defined to behave correctly even when the source and
  ;; destination regions overlap, unlike a naive forward byte-copy loop.
  (func $copy_bytes (export "copy_bytes") (param $dst i32) (param $src i32) (param $len i32)
    (memory.copy (local.get $dst) (local.get $src) (local.get $len)))

  (func $read_byte (export "read_byte") (param $addr i32) (result i32)
    (i32.load8_u (local.get $addr)))
)
