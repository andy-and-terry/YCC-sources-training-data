(module
  (func (export "sign") (param i32) (result i32)
    (block $out
      (br_if $out (i32.eqz (local.get 0)))
      (return (select (i32.const 1) (i32.const -1) (i32.gt_s (local.get 0) (i32.const 0)))))
    (i32.const 0)))
