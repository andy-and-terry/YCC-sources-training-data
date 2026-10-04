(module
  (func $popcount (export "popcount") (param $x i32) (result i32)
    (i32.popcnt (local.get $x)))

  (func $clz (export "clz") (param $x i32) (result i32)
    (i32.clz (local.get $x)))

  (func $ctz (export "ctz") (param $x i32) (result i32)
    (i32.ctz (local.get $x)))

  ;; floor(log2(x)) for x > 0
  (func $log2_floor (export "log2_floor") (param $x i32) (result i32)
    (i32.sub (i32.const 31) (i32.clz (local.get $x))))

  (func $is_power_of_two (export "is_power_of_two") (param $x i32) (result i32)
    (i32.and
      (i32.ne (local.get $x) (i32.const 0))
      (i32.eq (i32.popcnt (local.get $x)) (i32.const 1))))

  (func $popcount64 (export "popcount64") (param $x i64) (result i32)
    (i32.wrap_i64 (i64.popcnt (local.get $x))))

  (func $hamming_distance (export "hamming_distance") (param $a i32) (param $b i32) (result i32)
    (i32.popcnt (i32.xor (local.get $a) (local.get $b))))
)
