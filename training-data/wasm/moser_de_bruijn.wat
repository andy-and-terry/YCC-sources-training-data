(module
  ;; Moser-de Bruijn sequence: binary digits of n read in base 4.  moser(11) == 69
  (func (export "moser") (param $n i32) (result i32)
    (local $result i32) (local $place i32)
    (local.set $place (i32.const 1))
    (block $done
      (loop $next
        (br_if $done (i32.eqz (local.get $n)))
        (if (i32.and (local.get $n) (i32.const 1))
          (then (local.set $result (i32.add (local.get $result) (local.get $place)))))
        (local.set $n (i32.shr_u (local.get $n) (i32.const 1)))
        (local.set $place (i32.shl (local.get $place) (i32.const 2)))
        (br $next)))
    (local.get $result)))
