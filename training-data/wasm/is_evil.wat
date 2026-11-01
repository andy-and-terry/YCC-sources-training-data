(module
  ;; Evil numbers have an even number of 1 bits.
  (func (export "is_evil") (param $n i32) (result i32)
    (i32.eqz (i32.and (i32.popcnt (local.get $n)) (i32.const 1)))))
