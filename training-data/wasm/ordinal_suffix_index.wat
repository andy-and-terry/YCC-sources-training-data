;; Returns 0=th, 1=st, 2=nd, 3=rd for the ordinal suffix of n.
(module
  (func (export "suffix_index") (param $n i32) (result i32)
    (local $r100 i32)
    (local.set $r100 (i32.rem_u (local.get $n) (i32.const 100)))
    (if (result i32)
      (i32.and (i32.ge_u (local.get $r100) (i32.const 11))
               (i32.le_u (local.get $r100) (i32.const 13)))
      (then (i32.const 0))
      (else
        (block $out (result i32)
          (br_if $out (i32.const 1) (i32.eq (i32.rem_u (local.get $n) (i32.const 10)) (i32.const 1)))
          (br_if $out (i32.const 2) (i32.eq (i32.rem_u (local.get $n) (i32.const 10)) (i32.const 2)))
          (br_if $out (i32.const 3) (i32.eq (i32.rem_u (local.get $n) (i32.const 10)) (i32.const 3)))
          (i32.const 0))))))
