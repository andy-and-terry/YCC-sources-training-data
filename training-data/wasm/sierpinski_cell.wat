(module
  ;; returns 1 if Pascal(r, c) is odd, i.e. the Sierpinski cell is filled
  (func (export "filled") (param $r i32) (param $c i32) (result i32)
    (i32.eq (i32.and (local.get $r) (local.get $c)) (local.get $c))))
