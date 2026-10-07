(module
  (func $increment_and_square (export "increment_and_square") (param $x i32) (result i32)
    (local $temp i32)
    (i32.mul
      (local.tee $temp (i32.add (local.get $x) (i32.const 1)))
      (local.get $temp)))
)
