(module
  ;; Number of differing bits between two integers
  (func (export "hamming_distance") (param $a i32) (param $b i32) (result i32)
    (i32.popcnt (i32.xor (local.get $a) (local.get $b))))

  ;; Same via Kernighan's loop, clearing the lowest set bit each step
  (func (export "hamming_loop") (param $a i32) (param $b i32) (result i32)
    (local $x i32)
    (local $count i32)
    (local.set $x (i32.xor (local.get $a) (local.get $b)))
    (block $done
      (loop $next
        (br_if $done (i32.eqz (local.get $x)))
        (local.set $x (i32.and (local.get $x) (i32.sub (local.get $x) (i32.const 1))))
        (local.set $count (i32.add (local.get $count) (i32.const 1)))
        (br $next)))
    (local.get $count))
)
