(module
  (memory (export "memory") 1)
  ;; coefficients 2x^3 + 0x^2 - 3x + 5, highest degree first
  (data (i32.const 0) "\02\00\00\00\00\00\00\00\fd\ff\ff\ff\05\00\00\00")

  ;; Horner's method: evaluate polynomial of n i32 coefficients at x
  (func $horner (export "horner") (param $ptr i32) (param $n i32) (param $x i32) (result i32)
    (local $acc i32)
    (block $done
      (loop $next
        (br_if $done (i32.eqz (local.get $n)))
        (local.set $acc
          (i32.add
            (i32.mul (local.get $acc) (local.get $x))
            (i32.load (local.get $ptr))))
        (local.set $ptr (i32.add (local.get $ptr) (i32.const 4)))
        (local.set $n (i32.sub (local.get $n) (i32.const 1)))
        (br $next)))
    (local.get $acc))

  (func (export "eval_demo") (param $x i32) (result i32)
    (call $horner (i32.const 0) (i32.const 4) (local.get $x)))
)
