(module
  ;; f64 -> f32 loses precision; f32 -> f64 is exact.
  (func $demote (export "demote") (param $x f64) (result f32)
    (f32.demote_f64 (local.get $x)))
  (func $promote (export "promote") (param $x f32) (result f64)
    (f64.promote_f32 (local.get $x)))
  (func $round_trip_error (export "round_trip_error") (param $x f64) (result f64)
    (f64.sub (local.get $x) (f64.promote_f32 (f32.demote_f64 (local.get $x))))))
