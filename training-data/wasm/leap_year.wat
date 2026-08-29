(module
  (func $is_leap_year (export "is_leap_year") (param $year i32) (result i32)
    (i32.or
      (i32.and
        (i32.eqz (i32.rem_s (local.get $year) (i32.const 4)))
        (i32.ne (i32.rem_s (local.get $year) (i32.const 100)) (i32.const 0)))
      (i32.eqz (i32.rem_s (local.get $year) (i32.const 400)))))
)
