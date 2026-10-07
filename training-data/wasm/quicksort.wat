(module
  (memory (export "memory") 1)

  (func $partition (param $base i32) (param $low i32) (param $high i32) (result i32)
    (local $pivot i32)
    (local $i i32)
    (local $j i32)
    (local $addr_i i32)
    (local $addr_j i32)
    (local $tmp i32)
    (local.set $pivot (i32.load (i32.add (local.get $base) (i32.mul (local.get $high) (i32.const 4)))))
    (local.set $i (i32.sub (local.get $low) (i32.const 1)))
    (local.set $j (local.get $low))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $j) (local.get $high)))
        (local.set $addr_j (i32.add (local.get $base) (i32.mul (local.get $j) (i32.const 4))))
        (if (i32.le_s (i32.load (local.get $addr_j)) (local.get $pivot))
          (then
            (local.set $i (i32.add (local.get $i) (i32.const 1)))
            (local.set $addr_i (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4))))
            (local.set $tmp (i32.load (local.get $addr_i)))
            (i32.store (local.get $addr_i) (i32.load (local.get $addr_j)))
            (i32.store (local.get $addr_j) (local.get $tmp))))
        (local.set $j (i32.add (local.get $j) (i32.const 1)))
        (br $loop)))
    (local.set $i (i32.add (local.get $i) (i32.const 1)))
    (local.set $addr_i (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4))))
    (local.set $addr_j (i32.add (local.get $base) (i32.mul (local.get $high) (i32.const 4))))
    (local.set $tmp (i32.load (local.get $addr_i)))
    (i32.store (local.get $addr_i) (i32.load (local.get $addr_j)))
    (i32.store (local.get $addr_j) (local.get $tmp))
    (local.get $i))

  ;; Lomuto-partition quicksort over an i32 array in linear memory.
  (func $quicksort (export "quicksort") (param $base i32) (param $low i32) (param $high i32)
    (local $p i32)
    (if (i32.lt_s (local.get $low) (local.get $high))
      (then
        (local.set $p (call $partition (local.get $base) (local.get $low) (local.get $high)))
        (call $quicksort (local.get $base) (local.get $low) (i32.sub (local.get $p) (i32.const 1)))
        (call $quicksort (local.get $base) (i32.add (local.get $p) (i32.const 1)) (local.get $high)))))
)
