(module
  ;; -1 is 0xFFFFFFFF: smaller than 1 when signed, larger when unsigned
  (func (export "lt_s") (param $a i32) (param $b i32) (result i32)
    (i32.lt_s (local.get $a) (local.get $b)))

  (func (export "lt_u") (param $a i32) (param $b i32) (result i32)
    (i32.lt_u (local.get $a) (local.get $b)))

  (func (export "ge_u") (param $a i32) (param $b i32) (result i32)
    (i32.ge_u (local.get $a) (local.get $b)))

  (func (export "minus_one_vs_one_unsigned") (result i32)
    (i32.gt_u (i32.const -1) (i32.const 1)))
)
