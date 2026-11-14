(module
  (func (export "fact") (param $n i32) (result i32)
    (local $r i32)
    (local.set $r (i32.const 1))
    (block $done
      (loop $l
        (br_if $done (i32.le_s (local.get $n) (i32.const 1)))
        (local.set $r (i32.mul (local.get $r) (local.get $n)))
        (local.set $n (i32.sub (local.get $n) (i32.const 1)))
        (br $l)))
    local.get $r))
