(module
  (import "env" "log" (func $log (param i32)))

  (func $compute_and_log (export "compute_and_log") (param $a i32) (param $b i32) (result i32)
    (local $sum i32)
    (local.set $sum (i32.add (local.get $a) (local.get $b)))
    (call $log (local.get $sum))
    (local.get $sum))
)
