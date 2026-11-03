(module
  (func $is_vowel (export "is_vowel") (param $c i32) (result i32)
    (local.set $c (i32.or (local.get $c) (i32.const 32)))
    (i32.or
      (i32.or
        (i32.or (i32.eq (local.get $c) (i32.const 97)) (i32.eq (local.get $c) (i32.const 101)))
        (i32.or (i32.eq (local.get $c) (i32.const 105)) (i32.eq (local.get $c) (i32.const 111))))
      (i32.eq (local.get $c) (i32.const 117)))))
