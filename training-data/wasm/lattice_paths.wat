(module
  ;; Lattice paths in an n x n grid using the multiplicative binomial C(2n, n).
  (func (export "lattice") (param $n i32) (result i64)
    (local $i i32) (local $r i64)
    (local.set $r (i64.const 1))
    (local.set $i (i32.const 1))
    (block $done
      (loop $next
        (br_if $done (i32.gt_u (local.get $i) (local.get $n)))
        (local.set $r
          (i64.div_u
            (i64.mul (local.get $r) (i64.extend_i32_u (i32.add (local.get $n) (local.get $i))))
            (i64.extend_i32_u (local.get $i))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (local.get $r)))
