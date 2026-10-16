(module
  ;; Scale factor supplied by the host as an immutable global import.
  (import "env" "scale" (global $scale i32))

  (func $scaled (export "scaled") (param $x i32) (result i32)
    (i32.mul (local.get $x) (global.get $scale))))
