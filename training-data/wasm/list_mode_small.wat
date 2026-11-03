(module
  (memory 1)
  ;; counts live at offset 0 (one i32 per value 0..255); returns the largest count.
  (func $tally (export "tally") (param $v i32) (result i32)
    (local $addr i32) (local $c i32)
    (local.set $addr (i32.mul (local.get $v) (i32.const 4)))
    (local.set $c (i32.add (i32.load (local.get $addr)) (i32.const 1)))
    (i32.store (local.get $addr) (local.get $c))
    (local.get $c)))
