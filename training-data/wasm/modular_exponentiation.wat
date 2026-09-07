(module
  (func $mod_pow (export "mod_pow") (param $base i32) (param $exp i32) (param $mod i32) (result i32)
    (local $result i32)
    (local $b i32)
    (local $e i32)
    (local.set $result (i32.const 1))
    (local.set $b (i32.rem_s (local.get $base) (local.get $mod)))
    (local.set $e (local.get $exp))
    (block $done
      (loop $loop
        (br_if $done (i32.eqz (local.get $e)))
        (if (i32.eq (i32.rem_s (local.get $e) (i32.const 2)) (i32.const 1))
          (then
            (local.set $result (i32.rem_s (i32.mul (local.get $result) (local.get $b)) (local.get $mod)))))
        (local.set $b (i32.rem_s (i32.mul (local.get $b) (local.get $b)) (local.get $mod)))
        (local.set $e (i32.div_s (local.get $e) (i32.const 2)))
        (br $loop)))
    (local.get $result))
)
