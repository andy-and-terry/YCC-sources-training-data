(module
  (func $min3 (export "min3") (param $a i32) (param $b i32) (param $c i32) (result i32)
    (local $m i32)
    (local.set $m (select (local.get $a) (local.get $b) (i32.lt_s (local.get $a) (local.get $b))))
    (select (local.get $m) (local.get $c) (i32.lt_s (local.get $m) (local.get $c)))))
