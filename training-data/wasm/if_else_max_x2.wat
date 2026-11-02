(module
  (func (export "max") (param i32 i32) (result i32)
    (if (result i32) (i32.gt_s (local.get 0) (local.get 1))
      (then (local.get 0))
      (else (local.get 1)))))
