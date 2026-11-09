(module
  (func (export "max") (param i32 i32) (result i32)
    (select (local.get 0) (local.get 1)
      (i32.gt_s (local.get 0) (local.get 1)))))
