(module
  ;; population count with the n &= n-1 trick
  (func (export "popcount") (param $n i32) (result i32)
    (local $c i32)
    (block $done
      (loop $again
        (br_if $done (i32.eqz (local.get $n)))
        (local.set $n (i32.and (local.get $n) (i32.sub (local.get $n) (i32.const 1))))
        (local.set $c (i32.add (local.get $c) (i32.const 1)))
        (br $again)))
    (local.get $c))
  ;; the instruction does the same in one step
  (func (export "popcount_builtin") (param $n i32) (result i32)
    (i32.popcnt (local.get $n))))
