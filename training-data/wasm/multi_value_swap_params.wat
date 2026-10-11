(module
  (func $swap (export "swap") (param $a i32) (param $b i32) (result i32 i32)
    (local.get $b)
    (local.get $a))

  (func $divmod (export "divmod") (param $a i32) (param $b i32) (result i32 i32)
    (i32.div_u (local.get $a) (local.get $b))
    (i32.rem_u (local.get $a) (local.get $b))))
