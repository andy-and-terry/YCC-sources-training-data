(module
  ;; Longest run of consecutive 1 bits in a 32-bit integer.
  (func $max_run (export "max_run") (param $n i32) (result i32)
    (local $best i32)
    (local $cur i32)
    (block $exit
      (loop $scan
        (br_if $exit (i32.eqz (local.get $n)))
        (if (i32.and (local.get $n) (i32.const 1))
          (then
            (local.set $cur (i32.add (local.get $cur) (i32.const 1)))
            (if (i32.gt_u (local.get $cur) (local.get $best))
              (then (local.set $best (local.get $cur)))))
          (else (local.set $cur (i32.const 0))))
        (local.set $n (i32.shr_u (local.get $n) (i32.const 1)))
        (br $scan)))
    (local.get $best))

  ;; Alternative: repeated n &= n << 1 shrinks each run by one bit.
  (func (export "max_run_shift") (param $n i32) (result i32)
    (local $count i32)
    (block $exit
      (loop $again
        (br_if $exit (i32.eqz (local.get $n)))
        (local.set $n (i32.and (local.get $n) (i32.shl (local.get $n) (i32.const 1))))
        (local.set $count (i32.add (local.get $count) (i32.const 1)))
        (br $again)))
    (local.get $count))
)
