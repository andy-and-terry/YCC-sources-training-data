(module
  (func $floor (export "floor") (param f64) (result f64) (f64.floor (local.get 0)))
  (func $ceil  (export "ceil")  (param f64) (result f64) (f64.ceil  (local.get 0)))
  (func $trunc (export "trunc") (param f64) (result f64) (f64.trunc (local.get 0)))
  ;; nearest rounds half to even
  (func $nearest (export "nearest") (param f64) (result f64) (f64.nearest (local.get 0))))
