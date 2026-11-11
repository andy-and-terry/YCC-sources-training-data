;; Population count (number of set bits) for 0..15
(module
  (func $bits (export "bits") (param $n i32) (result i32)
    (i32.popcnt (local.get $n)))
)
