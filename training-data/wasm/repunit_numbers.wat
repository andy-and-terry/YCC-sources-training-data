(module
  ;; Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
  ;; repunit(8) == 11111111
  (func (export "repunit") (param $k i32) (result i64)
    (local $r i64)
    (block $done
      (loop $next
        (br_if $done (i32.eqz (local.get $k)))
        (local.set $r (i64.add (i64.mul (local.get $r) (i64.const 10)) (i64.const 1)))
        (local.set $k (i32.sub (local.get $k) (i32.const 1)))
        (br $next)))
    (local.get $r)))
