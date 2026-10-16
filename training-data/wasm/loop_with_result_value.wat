(module
  ;; Count how many halvings reach zero; uses a loop's result type.
  (func $log2_floor (export "log2_floor") (param $n i32) (result i32)
    (local $r i32)
    (loop $l (result i32)
      (if (i32.gt_u (local.get $n) (i32.const 1))
        (then
          (local.set $n (i32.shr_u (local.get $n) (i32.const 1)))
          (local.set $r (i32.add (local.get $r) (i32.const 1)))
          (br $l)))
      (local.get $r))))
