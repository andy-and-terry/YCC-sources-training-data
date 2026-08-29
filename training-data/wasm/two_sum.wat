(module
  (memory (export "memory") 1)

  (func $two_sum (export "two_sum") (param $base i32) (param $len i32) (param $target i32) (result i32) (result i32)
    (local $i i32)
    (local $j i32)
    (local $vi i32)
    (local $vj i32)
    (local.set $i (i32.const 0))
    (block $found
      (loop $outer
        (br_if $found (i32.ge_s (local.get $i) (i32.sub (local.get $len) (i32.const 1))))
        (local.set $vi (i32.load (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4)))))
        (local.set $j (i32.add (local.get $i) (i32.const 1)))
        (block $inner_done
          (loop $inner
            (br_if $inner_done (i32.ge_s (local.get $j) (local.get $len)))
            (local.set $vj (i32.load (i32.add (local.get $base) (i32.mul (local.get $j) (i32.const 4)))))
            (br_if $found (i32.eq (i32.add (local.get $vi) (local.get $vj)) (local.get $target)))
            (local.set $j (i32.add (local.get $j) (i32.const 1)))
            (br $inner)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $outer)))
    (local.get $i)
    (local.get $j))
)
