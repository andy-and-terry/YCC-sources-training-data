;; Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
(module
  ;; Iterative: returns T(n)
  (func $trib (export "trib") (param $n i32) (result i32)
    (local $a i32) (local $b i32) (local $c i32) (local $next i32)
    (local.set $c (i32.const 1))
    (block $done
      (loop $next_term
        (br_if $done (i32.eqz (local.get $n)))
        (local.set $next (i32.add (i32.add (local.get $a) (local.get $b)) (local.get $c)))
        (local.set $a (local.get $b))
        (local.set $b (local.get $c))
        (local.set $c (local.get $next))
        (local.set $n (i32.sub (local.get $n) (i32.const 1)))
        (br $next_term)))
    (local.get $a))
)
