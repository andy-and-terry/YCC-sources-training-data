(module
  ;; ipow(base, exp) by repeated multiplication
  (func $ipow (param $b i32) (param $e i32) (result i32)
    (local $r i32)
    (local.set $r (i32.const 1))
    (block $done
      (loop $again
        (br_if $done (i32.eqz (local.get $e)))
        (local.set $r (i32.mul (local.get $r) (local.get $b)))
        (local.set $e (i32.sub (local.get $e) (i32.const 1)))
        (br $again)))
    (local.get $r))

  ;; Leyland number: x^y + y^x. leyland(4, 3) = 145.
  (func (export "leyland") (param $x i32) (param $y i32) (result i32)
    (i32.add
      (call $ipow (local.get $x) (local.get $y))
      (call $ipow (local.get $y) (local.get $x)))))
