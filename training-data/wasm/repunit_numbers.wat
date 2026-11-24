(module
  ;; Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.  repunit(5) == 11111
  (func (export "repunit") (param $n i64) (result i64)
    (local $r i64)
    (block $done
      (loop $next
        (br_if $done (i64.eqz (local.get $n)))
        (local.set $r (i64.add (i64.mul (local.get $r) (i64.const 10)) (i64.const 1)))
        (local.set $n (i64.sub (local.get $n) (i64.const 1)))
        (br $next)))
    (local.get $r)))
