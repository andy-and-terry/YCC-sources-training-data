(module
  (func $is_triple (export "is_triple") (param $a i32) (param $b i32) (param $c i32) (result i32)
    (i32.eq
      (i32.add
        (i32.mul (local.get $a) (local.get $a))
        (i32.mul (local.get $b) (local.get $b)))
      (i32.mul (local.get $c) (local.get $c))))
)
