(module
  ;; Adds two 32-bit values the way a ripple-carry adder does: XOR for the
  ;; sum bits, AND-shifted for the carries, repeated until no carry remains.
  (func $add_ripple (export "add_ripple") (param $a i32) (param $b i32) (result i32)
    (local $carry i32)
    (block $done
      (loop $again
        (br_if $done (i32.eqz (local.get $b)))
        (local.set $carry (i32.shl (i32.and (local.get $a) (local.get $b)) (i32.const 1)))
        (local.set $a (i32.xor (local.get $a) (local.get $b)))
        (local.set $b (local.get $carry))
        (br $again)))
    (local.get $a))
)
