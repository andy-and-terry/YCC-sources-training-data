(module
  (func $is_palindrome_number (export "is_palindrome_number") (param $n i32) (result i32)
    (local $orig i32) (local $r i32)
    (local.set $orig (local.get $n))
    (block $done
      (loop $l
        (br_if $done (i32.eqz (local.get $n)))
        (local.set $r
          (i32.add (i32.mul (local.get $r) (i32.const 10))
                   (i32.rem_u (local.get $n) (i32.const 10))))
        (local.set $n (i32.div_u (local.get $n) (i32.const 10)))
        (br $l)))
    (i32.eq (local.get $r) (local.get $orig))))
