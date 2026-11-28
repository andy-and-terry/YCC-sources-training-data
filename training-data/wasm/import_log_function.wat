(module
  (import "env" "log" (func $log (param i32)))
  (func (export "run")
    (call $log (i32.const 42))))
