(module
  (memory (export "mem") 1)
  (data (i32.const 0) "abcabc")
  ;; hash of k bytes starting at offset
  (func (export "window_hash") (param $off i32) (param $k i32) (result i32)
    (local $h i32) (local $i i32)
    (loop $l
      (local.set $h
        (i32.rem_u
          (i32.add (i32.mul (local.get $h) (i32.const 31))
                   (i32.load8_u (i32.add (local.get $off) (local.get $i))))
          (i32.const 1000003)))
      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br_if $l (i32.lt_u (local.get $i) (local.get $k))))
    (local.get $h)))
