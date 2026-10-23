(module
  (memory (export "memory") 1)

  ;; Writes numerator/denominator pairs of F_n as i32s starting at address 0.
  ;; Returns the number of terms.
  (func $farey (export "farey") (param $n i32) (result i32)
    (local $a i32) (local $b i32) (local $c i32) (local $d i32)
    (local $k i32) (local $e i32) (local $f i32) (local $count i32)
    (local.set $b (i32.const 1))
    (local.set $c (i32.const 1))
    (local.set $d (local.get $n))
    (block $done
      (loop $loop
        (i32.store (i32.shl (local.get $count) (i32.const 3)) (local.get $a))
        (i32.store
          (i32.add (i32.shl (local.get $count) (i32.const 3)) (i32.const 4))
          (local.get $b))
        (local.set $count (i32.add (local.get $count) (i32.const 1)))
        (br_if $done
          (i32.and (i32.eq (local.get $a) (i32.const 1))
                   (i32.eq (local.get $b) (i32.const 1))))
        (local.set $k
          (i32.div_u (i32.add (local.get $n) (local.get $b)) (local.get $d)))
        (local.set $e (i32.sub (i32.mul (local.get $k) (local.get $c)) (local.get $a)))
        (local.set $f (i32.sub (i32.mul (local.get $k) (local.get $d)) (local.get $b)))
        (local.set $a (local.get $c))
        (local.set $b (local.get $d))
        (local.set $c (local.get $e))
        (local.set $d (local.get $f))
        (br $loop)))
    (local.get $count))
)
