(module
  ;; f32.min / f32.max propagate NaN, unlike a naive select-based comparison.
  (func $fmin (export "fmin") (param $a f32) (param $b f32) (result f32)
    (f32.min (local.get $a) (local.get $b)))
  (func $fmax (export "fmax") (param $a f32) (param $b f32) (result f32)
    (f32.max (local.get $a) (local.get $b)))
  (func $is_nan (export "is_nan") (param $x f32) (result i32)
    (f32.ne (local.get $x) (local.get $x))))
