(module
  (func (export "is_powerful") (param $n i32) (result i32)
    (local $p i32)
    (local.set $p (i32.const 2))
    (block $done
      (loop $next
        (br_if $done (i32.gt_u (i32.mul (local.get $p) (local.get $p)) (local.get $n)))
        (if (i32.eqz (i32.rem_u (local.get $n) (local.get $p)))
          (then
            (if (i32.rem_u (local.get $n) (i32.mul (local.get $p) (local.get $p)))
              (then (return (i32.const 0))))
            (block $strip_done
              (loop $strip
                (br_if $strip_done (i32.rem_u (local.get $n) (local.get $p)))
                (local.set $n (i32.div_u (local.get $n) (local.get $p)))
                (br $strip)))))
        (local.set $p (i32.add (local.get $p) (i32.const 1)))
        (br $next)))
    (i32.eq (local.get $n) (i32.const 1)))
)
