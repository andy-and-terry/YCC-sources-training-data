(module
  (func $double (param i32) (result i32)
    (i32.mul (local.get 0) (i32.const 2)))
  (elem declare func $double)

  (func (export "null_is_null") (result i32)
    (ref.is_null (ref.null func)))

  (func (export "func_is_null") (result i32)
    (ref.is_null (ref.func $double)))
)
