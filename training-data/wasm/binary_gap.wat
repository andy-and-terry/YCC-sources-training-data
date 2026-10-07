(module
  ;; Longest run of zeros between two ones in the binary form of n.
  (func $binary_gap (export "binary_gap") (param $n i32) (result i32)
    (local $best i32)
    (local $current i32)
    (local $seen_one i32)
    (block $done
      (loop $next
        (br_if $done (i32.eqz (local.get $n)))
        (if (i32.and (local.get $n) (i32.const 1))
          (then
            (if (i32.gt_u (local.get $current) (local.get $best))
              (then (local.set $best (local.get $current))))
            (local.set $current (i32.const 0))
            (local.set $seen_one (i32.const 1)))
          (else
            (if (local.get $seen_one)
              (then (local.set $current (i32.add (local.get $current) (i32.const 1)))))))
        (local.set $n (i32.shr_u (local.get $n) (i32.const 1)))
        (br $next)))
    (local.get $best))
)
