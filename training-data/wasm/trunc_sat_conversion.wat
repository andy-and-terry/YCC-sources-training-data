(module
  ;; Saturating conversions never trap: NaN -> 0, overflow -> min/max
  (func (export "to_i32_sat") (param $x f64) (result i32)
    (i32.trunc_sat_f64_s (local.get $x)))

  (func (export "to_u32_sat") (param $x f64) (result i32)
    (i32.trunc_sat_f64_u (local.get $x)))

  ;; Trapping version for comparison (traps on NaN or out of range)
  (func (export "to_i32_trap") (param $x f64) (result i32)
    (i32.trunc_f64_s (local.get $x)))

  (func (export "to_f64") (param $x i32) (result f64)
    (f64.convert_i32_s (local.get $x)))
)
