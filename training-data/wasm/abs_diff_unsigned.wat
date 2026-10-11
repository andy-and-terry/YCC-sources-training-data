(module
  (func $abs_diff (export "abs_diff") (param $a i32) (param $b i32) (result i32)
    (select
      (i32.sub (local.get $a) (local.get $b))
      (i32.sub (local.get $b) (local.get $a))
      (i32.ge_u (local.get $a) (local.get $b)))))
