(module
  (func $popcount (export "popcount") (param $x i32) (result i32)
    (local $count i32)
    (local $n i32)
    (local.set $n (local.get $x))
    (local.set $count (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.eqz (local.get $n)))
        (local.set $count (i32.add (local.get $count) (i32.and (local.get $n) (i32.const 1))))
        (local.set $n (i32.shr_u (local.get $n) (i32.const 1)))
        (br $loop)))
    (local.get $count))
)
