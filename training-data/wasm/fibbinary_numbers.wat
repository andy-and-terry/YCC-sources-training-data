(module
  ;; Fibbinary numbers: no two adjacent 1 bits.
  (func (export "is_fibbinary") (param $n i32) (result i32)
    (i32.eqz (i32.and (local.get $n) (i32.shr_u (local.get $n) (i32.const 1)))))

  ;; Count fibbinary numbers in [0, limit); count(50) == 21.
  (func (export "count_below") (param $limit i32) (result i32)
    (local $n i32) (local $count i32)
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $n) (local.get $limit)))
        (local.set $count (i32.add (local.get $count) (call 0 (local.get $n))))
        (local.set $n (i32.add (local.get $n) (i32.const 1)))
        (br $next)))
    (local.get $count)))
