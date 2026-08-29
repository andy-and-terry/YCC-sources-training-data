(module
  (memory (export "memory") 1)

  (func $min_array (export "min_array") (param $base i32) (param $len i32) (result i32)
    (local $i i32)
    (local $min i32)
    (local $val i32)
    (local.set $min (i32.load (local.get $base)))
    (local.set $i (i32.const 1))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $i) (local.get $len)))
        (local.set $val (i32.load (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4)))))
        (local.set $min (select (local.get $val) (local.get $min) (i32.lt_s (local.get $val) (local.get $min))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop)))
    (local.get $min))
)
