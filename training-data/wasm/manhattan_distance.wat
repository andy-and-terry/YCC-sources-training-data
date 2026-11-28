(module
  (func $absdiff (param $a i32) (param $b i32) (result i32)
    (select
      (i32.sub (local.get $a) (local.get $b))
      (i32.sub (local.get $b) (local.get $a))
      (i32.ge_s (local.get $a) (local.get $b))))
  (func (export "manhattan") (param $x1 i32) (param $y1 i32) (param $x2 i32) (param $y2 i32) (result i32)
    (i32.add
      (call $absdiff (local.get $x1) (local.get $x2))
      (call $absdiff (local.get $y1) (local.get $y2)))))
