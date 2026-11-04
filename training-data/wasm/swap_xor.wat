;; Swap two values via XOR and return a packed result (a << 16 | b).
(module
  (func (export "swap_pack") (param $a i32) (param $b i32) (result i32)
    (local.set $a (i32.xor (local.get $a) (local.get $b)))
    (local.set $b (i32.xor (local.get $b) (local.get $a)))
    (local.set $a (i32.xor (local.get $a) (local.get $b)))
    (i32.or (i32.shl (local.get $a) (i32.const 16)) (local.get $b))))
