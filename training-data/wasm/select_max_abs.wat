(module
  (func (export "max") (param $a i32) (param $b i32) (result i32)
    (select (local.get $a) (local.get $b) (i32.gt_s (local.get $a) (local.get $b))))
  (func (export "abs") (param $x i32) (result i32)
    (select (i32.sub (i32.const 0) (local.get $x)) (local.get $x) (i32.lt_s (local.get $x) (i32.const 0)))))
