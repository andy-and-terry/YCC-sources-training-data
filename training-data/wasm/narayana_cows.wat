;; Narayana's cows N(n)=N(n-1)+N(n-3)
;; term(n) walks a sliding window of the last three values.
(module
  (func $term (export "term") (param $n i32) (result i32)
    (local $x0 i32) (local $x1 i32) (local $x2 i32) (local $next i32) (local $i i32)
    (local.set $x0 (i32.const 1))
    (local.set $x1 (i32.const 1))
    (local.set $x2 (i32.const 1))
    (if (i32.eq (local.get $n) (i32.const 0)) (then (return (local.get $x0))))
    (if (i32.eq (local.get $n) (i32.const 1)) (then (return (local.get $x1))))
    (if (i32.eq (local.get $n) (i32.const 2)) (then (return (local.get $x2))))
    (local.set $i (i32.const 3))
    (block $done
      (loop $next
        (br_if $done (i32.gt_u (local.get $i) (local.get $n)))
        ;; window: x0 = v[i-3], x1 = v[i-2], x2 = v[i-1]
        (local.set $next (i32.add (local.get $x2) (local.get $x0)))
        (local.set $x0 (local.get $x1))
        (local.set $x1 (local.get $x2))
        (local.set $x2 (local.get $next))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (local.get $x2))
)
