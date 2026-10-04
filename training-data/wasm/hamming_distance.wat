(module
  (func $hamming32 (export "hamming32") (param $a i32) (param $b i32) (result i32)
    (i32.popcnt (i32.xor (local.get $a) (local.get $b))))

  ;; Hamming distance between two byte strings of equal length in memory
  (memory (export "memory") 1)
  (data (i32.const 0) "karolin")
  (data (i32.const 16) "kathrin")

  (func $hamming_bytes (export "hamming_bytes") (param $a i32) (param $b i32) (param $len i32) (result i32)
    (local $i i32)
    (local $dist i32)
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $i) (local.get $len)))
        (local.set $dist
          (i32.add (local.get $dist)
            (i32.ne
              (i32.load8_u (i32.add (local.get $a) (local.get $i)))
              (i32.load8_u (i32.add (local.get $b) (local.get $i))))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (local.get $dist))

  (func $demo (export "demo") (result i32)
    (call $hamming_bytes (i32.const 0) (i32.const 16) (i32.const 7)))
)
