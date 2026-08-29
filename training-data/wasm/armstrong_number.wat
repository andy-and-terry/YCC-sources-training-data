(module
  (func $num_digits (export "num_digits") (param $n i32) (result i32)
    (local $count i32)
    (local.set $count (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.eqz (local.get $n)))
        (local.set $count (i32.add (local.get $count) (i32.const 1)))
        (local.set $n (i32.div_s (local.get $n) (i32.const 10)))
        (br $loop)))
    (local.get $count))

  (func $ipow (export "ipow") (param $base i32) (param $exp i32) (result i32)
    (local $result i32)
    (local $i i32)
    (local.set $result (i32.const 1))
    (local.set $i (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $i) (local.get $exp)))
        (local.set $result (i32.mul (local.get $result) (local.get $base)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop)))
    (local.get $result))

  (func $is_armstrong (export "is_armstrong") (param $n i32) (result i32)
    (local $power i32)
    (local $total i32)
    (local $num i32)
    (local $digit i32)
    (local.set $power (call $num_digits (local.get $n)))
    (local.set $total (i32.const 0))
    (local.set $num (local.get $n))
    (block $done
      (loop $loop
        (br_if $done (i32.eqz (local.get $num)))
        (local.set $digit (i32.rem_s (local.get $num) (i32.const 10)))
        (local.set $total (i32.add (local.get $total) (call $ipow (local.get $digit) (local.get $power))))
        (local.set $num (i32.div_s (local.get $num) (i32.const 10)))
        (br $loop)))
    (i32.eq (local.get $total) (local.get $n)))
)
