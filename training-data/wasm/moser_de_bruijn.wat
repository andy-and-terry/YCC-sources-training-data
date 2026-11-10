;; Read the binary digits of i as base-4 digits: 0 1 4 5 16 17 20 21 64 65 for i = 0..9
(module
  (func (export "moser") (param $i i32) (result i32)
    (local $value i32) (local $power i32)
    (local.set $power (i32.const 1))
    (block $done
      (loop $next
        (br_if $done (i32.eqz (local.get $i)))
        (if (i32.and (local.get $i) (i32.const 1))
          (then (local.set $value (i32.add (local.get $value) (local.get $power)))))
        (local.set $power (i32.shl (local.get $power) (i32.const 2)))
        (local.set $i (i32.shr_u (local.get $i) (i32.const 1)))
        (br $next)))
    (local.get $value)))
