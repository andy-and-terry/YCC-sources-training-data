(module
  (func $div_s (export "div_s") (param $a i32) (param $b i32) (result i32)
    (i32.div_s (local.get $a) (local.get $b)))

  (func $div_u (export "div_u") (param $a i32) (param $b i32) (result i32)
    (i32.div_u (local.get $a) (local.get $b)))

  (func $rem_s (export "rem_s") (param $a i32) (param $b i32) (result i32)
    (i32.rem_s (local.get $a) (local.get $b)))

  (func $rem_u (export "rem_u") (param $a i32) (param $b i32) (result i32)
    (i32.rem_u (local.get $a) (local.get $b)))

  ;; the same bit pattern compares differently when signed or unsigned
  (func $lt_s (export "lt_s") (param $a i32) (param $b i32) (result i32)
    (i32.lt_s (local.get $a) (local.get $b)))

  (func $lt_u (export "lt_u") (param $a i32) (param $b i32) (result i32)
    (i32.lt_u (local.get $a) (local.get $b)))

  (func $shr_s (export "shr_s") (param $a i32) (param $n i32) (result i32)
    (i32.shr_s (local.get $a) (local.get $n)))

  (func $shr_u (export "shr_u") (param $a i32) (param $n i32) (result i32)
    (i32.shr_u (local.get $a) (local.get $n)))

  (func $floor_div (export "floor_div") (param $a i32) (param $b i32) (result i32)
    (local $q i32)
    (local.set $q (i32.div_s (local.get $a) (local.get $b)))
    (if (i32.and
          (i32.ne (i32.rem_s (local.get $a) (local.get $b)) (i32.const 0))
          (i32.lt_s (i32.xor (local.get $a) (local.get $b)) (i32.const 0)))
      (then (local.set $q (i32.sub (local.get $q) (i32.const 1)))))
    (local.get $q))
)
