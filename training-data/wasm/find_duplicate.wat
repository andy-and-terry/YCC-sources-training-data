(module
  (memory (export "memory") 1)

  (func $find_duplicate (export "find_duplicate") (param $base i32) (param $len i32) (result i32)
    (local $i i32)
    (local $j i32)
    (local $vi i32)
    (local $vj i32)
    (local.set $i (i32.const 0))
    (block $done_outer
      (loop $outer
        (br_if $done_outer (i32.ge_s (local.get $i) (local.get $len)))
        (local.set $vi (i32.load (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4)))))
        (local.set $j (i32.add (local.get $i) (i32.const 1)))
        (block $done_inner
          (loop $inner
            (br_if $done_inner (i32.ge_s (local.get $j) (local.get $len)))
            (local.set $vj (i32.load (i32.add (local.get $base) (i32.mul (local.get $j) (i32.const 4)))))
            (if (i32.eq (local.get $vi) (local.get $vj))
              (then (return (local.get $vi))))
            (local.set $j (i32.add (local.get $j) (i32.const 1)))
            (br $inner)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $outer)))
    (i32.const -1))
)
