(module
  ;; closed form n*(n+1)/2
  (func $triangular (export "triangular") (param $n i32) (result i32)
    (i32.div_u
      (i32.mul (local.get $n) (i32.add (local.get $n) (i32.const 1)))
      (i32.const 2)))

  ;; loop version for comparison
  (func $triangular_loop (export "triangular_loop") (param $n i32) (result i32)
    (local $i i32)
    (local $sum i32)
    (local.set $i (i32.const 1))
    (block $done
      (loop $next
        (br_if $done (i32.gt_u (local.get $i) (local.get $n)))
        (local.set $sum (i32.add (local.get $sum) (local.get $i)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (local.get $sum))
)
