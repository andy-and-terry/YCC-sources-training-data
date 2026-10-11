(module
  (func $to_gray (export "to_gray") (param $n i32) (result i32)
    (i32.xor (local.get $n) (i32.shr_u (local.get $n) (i32.const 1))))

  (func $from_gray (export "from_gray") (param $g i32) (result i32)
    (local $n i32)
    (local.set $n (local.get $g))
    (block $done
      (loop $l
        (br_if $done (i32.eqz (local.get $g)))
        (local.set $g (i32.shr_u (local.get $g) (i32.const 1)))
        (local.set $n (i32.xor (local.get $n) (local.get $g)))
        (br $l)))
    (local.get $n)))
