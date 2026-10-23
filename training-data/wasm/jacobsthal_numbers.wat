;; Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
;; The host supplies env.print(i32); the start function prints 15 terms.
(module
  (import "env" "print" (func $print (param i32)))

  (func $jacobsthal (export "jacobsthal") (param $n i32) (result i32)
    (local $a i32) (local $b i32) (local $t i32)
    (local.set $b (i32.const 1))
    (block $done
      (loop $next
        (br_if $done (i32.eqz (local.get $n)))
        (local.set $t (i32.add (local.get $b)
                               (i32.shl (local.get $a) (i32.const 1))))
        (local.set $a (local.get $b))
        (local.set $b (local.get $t))
        (local.set $n (i32.sub (local.get $n) (i32.const 1)))
        (br $next)))
    (local.get $a))

  (func $main (local $i i32)
    (loop $again
      (call $print (call $jacobsthal (local.get $i)))
      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br_if $again (i32.lt_u (local.get $i) (i32.const 15)))))

  (start $main))
