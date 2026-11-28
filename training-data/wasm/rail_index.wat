(module
  ;; rail index of position i for k rails
  (func (export "rail") (param $i i32) (param $k i32) (result i32)
    (local $cycle i32) (local $r i32)
    (local.set $cycle (i32.mul (i32.const 2) (i32.sub (local.get $k) (i32.const 1))))
    (local.set $r (i32.rem_u (local.get $i) (local.get $cycle)))
    (select
      (local.get $r)
      (i32.sub (local.get $cycle) (local.get $r))
      (i32.lt_u (local.get $r) (local.get $k)))))
