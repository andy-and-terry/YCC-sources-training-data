(module
  (func (export "rotl") (param i32 i32) (result i32)
    (i32.rotl (local.get 0) (local.get 1)))
  (func (export "shr_u") (param i32 i32) (result i32)
    (i32.shr_u (local.get 0) (local.get 1))))
