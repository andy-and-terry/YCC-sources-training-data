(module
  ;; Number of differing bits between two integers, using the built-in popcnt.
  (func $hamming (export "hamming") (param $a i32) (param $b i32) (result i32)
    (i32.popcnt (i32.xor (local.get $a) (local.get $b))))

  (func $hamming64 (export "hamming64") (param $a i64) (param $b i64) (result i32)
    (i32.wrap_i64 (i64.popcnt (i64.xor (local.get $a) (local.get $b)))))
)
