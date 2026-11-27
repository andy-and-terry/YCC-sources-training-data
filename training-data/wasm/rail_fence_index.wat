(module
  ;; Rail (0-based) of position i in a zig-zag over `rails` rails.
  (func (export "rail_of") (param $i i32) (param $rails i32) (result i32)
    (local $period i32) (local $m i32)
    (local.set $period (i32.mul (i32.const 2) (i32.sub (local.get $rails) (i32.const 1))))
    (local.set $m (i32.rem_u (local.get $i) (local.get $period)))
    (select
      (local.get $m)
      (i32.sub (local.get $period) (local.get $m))
      (i32.lt_u (local.get $m) (local.get $rails))))
)
