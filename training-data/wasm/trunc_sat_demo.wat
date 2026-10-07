(module
  ;; trapping truncation: traps on NaN or out-of-range
  (func $trunc_trap (export "trunc_trap") (param $x f64) (result i32)
    (i32.trunc_f64_s (local.get $x)))

  ;; saturating truncation: NaN -> 0, clamps to i32 range
  (func $trunc_sat (export "trunc_sat") (param $x f64) (result i32)
    (i32.trunc_sat_f64_s (local.get $x)))

  (func $trunc_sat_u (export "trunc_sat_u") (param $x f64) (result i32)
    (i32.trunc_sat_f64_u (local.get $x)))

  (func $to_f64 (export "to_f64") (param $x i32) (result f64)
    (f64.convert_i32_s (local.get $x)))

  (func $round_nearest (export "round_nearest") (param $x f64) (result i32)
    (i32.trunc_sat_f64_s (f64.nearest (local.get $x))))
)
