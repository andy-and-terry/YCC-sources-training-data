;; Repunits: the n-th repunit (1, 11, 111, ...) via r = r*10 + 1
(module
  (func $repunit (export "repunit") (param $n i32) (result i64)
    (local $r i64)
    (block $done
      (loop $next
        (br_if $done (i32.eqz (local.get $n)))
        (local.set $r (i64.add (i64.mul (local.get $r) (i64.const 10)) (i64.const 1)))
        (local.set $n (i32.sub (local.get $n) (i32.const 1)))
        (br $next)))
    (local.get $r)))
