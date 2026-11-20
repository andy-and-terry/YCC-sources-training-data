(module
  ;; Compare-exchange of a pair packed into an i64: low 32 bits = a, high 32 bits = b.
  ;; Returns the pair with the smaller value in the low half.
  (func (export "order_pair") (param $a i32) (param $b i32) (result i64)
    (local $lo i32) (local $hi i32)
    (local.set $lo (select (local.get $a) (local.get $b) (i32.le_s (local.get $a) (local.get $b))))
    (local.set $hi (select (local.get $b) (local.get $a) (i32.le_s (local.get $a) (local.get $b))))
    (i64.or
      (i64.extend_i32_u (local.get $lo))
      (i64.shl (i64.extend_i32_u (local.get $hi)) (i64.const 32)))))
