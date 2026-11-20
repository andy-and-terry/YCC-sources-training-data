(module
  (func $abs (param $x i32) (result i32)
    (select (i32.sub (i32.const 0) (local.get $x)) (local.get $x) (i32.lt_s (local.get $x) (i32.const 0))))
  ;; |x1-x2| + |y1-y2|
  (func (export "manhattan") (param $x1 i32) (param $y1 i32) (param $x2 i32) (param $y2 i32) (result i32)
    (i32.add
      (call $abs (i32.sub (local.get $x1) (local.get $x2)))
      (call $abs (i32.sub (local.get $y1) (local.get $y2))))))
