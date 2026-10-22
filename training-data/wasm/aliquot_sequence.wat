(module
  (memory (export "memory") 1)

  ;; Writes the aliquot sequence of $n as i32s at address 0 and returns its length.
  (func $aliquot (export "aliquot") (param $n i32) (result i32)
    (local $len i32) (local $d i32) (local $sum i32)
    (block $done
      (loop $next
        (i32.store (i32.shl (local.get $len) (i32.const 2)) (local.get $n))
        (local.set $len (i32.add (local.get $len) (i32.const 1)))
        (br_if $done (i32.eqz (local.get $n)))
        (local.set $sum (i32.const 0))
        (local.set $d (i32.const 1))
        (block $sum_done
          (loop $divs
            (br_if $sum_done
              (i32.gt_s (local.get $d) (i32.shr_u (local.get $n) (i32.const 1))))
            (if (i32.eqz (i32.rem_s (local.get $n) (local.get $d)))
              (then (local.set $sum (i32.add (local.get $sum) (local.get $d)))))
            (local.set $d (i32.add (local.get $d) (i32.const 1)))
            (br $divs)))
        (local.set $n (local.get $sum))
        (br $next)))
    (local.get $len))
)
