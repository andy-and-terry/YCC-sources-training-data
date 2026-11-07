(module
  ;; ASCII code of the last letter of the column title: 28 ("AB") -> 66, 701 ("ZY") -> 89.
  (func $last_letter (export "last_letter") (param $n i32) (result i32)
    (i32.add (i32.const 65)
      (i32.rem_u (i32.sub (local.get $n) (i32.const 1)) (i32.const 26))))
)
