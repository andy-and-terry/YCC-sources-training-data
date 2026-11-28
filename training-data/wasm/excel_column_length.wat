(module
  ;; Number of letters in the spreadsheet column title for column n (1 -> 1, 27 -> 2, 703 -> 3).
  (func $title_length (export "title_length") (param $n i32) (result i32)
    (local $len i32)
    (block $done
      (loop $step
        (br_if $done (i32.le_s (local.get $n) (i32.const 0)))
        (local.set $n (i32.div_u (i32.sub (local.get $n) (i32.const 1)) (i32.const 26)))
        (local.set $len (i32.add (local.get $len) (i32.const 1)))
        (br $step)))
    (local.get $len))
)
