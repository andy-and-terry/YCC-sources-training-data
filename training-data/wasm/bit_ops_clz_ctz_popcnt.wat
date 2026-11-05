(module
  (func (export "bits") (param $x i32) (result i32)
    (i32.add
      (i32.add (i32.clz (local.get $x)) (i32.ctz (local.get $x)))
      (i32.popcnt (local.get $x)))))
