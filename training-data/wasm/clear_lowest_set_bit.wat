(module
  ;; Kernighan trick: n & (n - 1) clears the lowest set bit.
  (func $clear_lowest (export "clear_lowest") (param $n i32) (result i32)
    (i32.and (local.get $n) (i32.sub (local.get $n) (i32.const 1))))

  ;; Count set bits by repeated clearing.
  (func $count_by_clearing (export "count_by_clearing") (param $n i32) (result i32)
    (local $c i32)
    (block $done
      (loop $again
        (br_if $done (i32.eqz (local.get $n)))
        (local.set $n (call $clear_lowest (local.get $n)))
        (local.set $c (i32.add (local.get $c) (i32.const 1)))
        (br $again)))
    (local.get $c)))
