(module
  (func $f (param $x f64) (result f64)
    (f64.sub (f64.mul (local.get $x) (local.get $x)) (f64.const 2)))

  (func (export "secant") (param $x0 f64) (param $x1 f64) (result f64)
    (local $f0 f64) (local $f1 f64) (local $nx f64) (local $i i32)
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $i) (i32.const 50)))
        (local.set $f0 (call $f (local.get $x0)))
        (local.set $f1 (call $f (local.get $x1)))
        (br_if $done (f64.eq (local.get $f0) (local.get $f1)))
        (local.set $nx (f64.sub (local.get $x1)
          (f64.div (f64.mul (local.get $f1) (f64.sub (local.get $x1) (local.get $x0)))
                   (f64.sub (local.get $f1) (local.get $f0)))))
        (local.set $x0 (local.get $x1))
        (local.set $x1 (local.get $nx))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (local.get $x1))
)
