(module
  (memory (export "memory") 1)

  (func $swap (param $base i32) (param $i i32) (param $j i32)
    (local $tmp i32)
    (local $addr_i i32)
    (local $addr_j i32)
    (local.set $addr_i (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4))))
    (local.set $addr_j (i32.add (local.get $base) (i32.mul (local.get $j) (i32.const 4))))
    (local.set $tmp (i32.load (local.get $addr_i)))
    (i32.store (local.get $addr_i) (i32.load (local.get $addr_j)))
    (i32.store (local.get $addr_j) (local.get $tmp)))

  (func $partition (param $base i32) (param $lo i32) (param $hi i32) (result i32)
    (local $pivot i32)
    (local $i i32)
    (local $j i32)
    (local.set $pivot (i32.load (i32.add (local.get $base) (i32.mul (local.get $hi) (i32.const 4)))))
    (local.set $i (i32.sub (local.get $lo) (i32.const 1)))
    (local.set $j (local.get $lo))
    (block $done
      (loop $scan
        (br_if $done (i32.ge_s (local.get $j) (local.get $hi)))
        (if (i32.le_s (i32.load (i32.add (local.get $base) (i32.mul (local.get $j) (i32.const 4)))) (local.get $pivot))
          (then
            (local.set $i (i32.add (local.get $i) (i32.const 1)))
            (call $swap (local.get $base) (local.get $i) (local.get $j))))
        (local.set $j (i32.add (local.get $j) (i32.const 1)))
        (br $scan)))
    (call $swap (local.get $base) (i32.add (local.get $i) (i32.const 1)) (local.get $hi))
    (i32.add (local.get $i) (i32.const 1)))

  (func $quicksort (export "quicksort") (param $base i32) (param $lo i32) (param $hi i32)
    (local $p i32)
    (if (i32.lt_s (local.get $lo) (local.get $hi))
      (then
        (local.set $p (call $partition (local.get $base) (local.get $lo) (local.get $hi)))
        (call $quicksort (local.get $base) (local.get $lo) (i32.sub (local.get $p) (i32.const 1)))
        (call $quicksort (local.get $base) (i32.add (local.get $p) (i32.const 1)) (local.get $hi)))))
)
