(module
  (memory (export "memory") 1)

  ;; Expand-around-center longest palindromic substring over an ASCII
  ;; string at str_base of length n. Checks both odd-length centers
  ;; (one character) and even-length centers (a gap between two), and
  ;; returns the best (start << 16) | length packed into one i32.

  (func $expand (param $str_base i32) (param $n i32) (param $left i32) (param $right i32) (result i32)
    (local $l i32)
    (local $r i32)
    (local.set $l (local.get $left))
    (local.set $r (local.get $right))
    (block $done
      (loop $loop
        (br_if $done (i32.lt_s (local.get $l) (i32.const 0)))
        (br_if $done (i32.ge_s (local.get $r) (local.get $n)))
        (br_if $done (i32.ne (i32.load8_u (i32.add (local.get $str_base) (local.get $l))) (i32.load8_u (i32.add (local.get $str_base) (local.get $r)))))
        (local.set $l (i32.sub (local.get $l) (i32.const 1)))
        (local.set $r (i32.add (local.get $r) (i32.const 1)))
        (br $loop)))
    ;; l/r have overshot by one on both sides; the palindrome is (l+1 .. r-1).
    (i32.or (i32.shl (i32.add (local.get $l) (i32.const 1)) (i32.const 16)) (i32.sub (i32.sub (local.get $r) (local.get $l)) (i32.const 1))))

  (func $longest_palindrome (export "longest_palindrome") (param $str_base i32) (param $n i32) (result i32)
    (local $i i32)
    (local $odd i32)
    (local $even i32)
    (local $best i32)
    (local $best_len i32)
    (local.set $best (i32.const 0))
    (local.set $best_len (i32.const 0))
    (local.set $i (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $i) (local.get $n)))
        (local.set $odd (call $expand (local.get $str_base) (local.get $n) (local.get $i) (local.get $i)))
        (if (i32.gt_s (i32.and (local.get $odd) (i32.const 0xffff)) (local.get $best_len))
          (then
            (local.set $best (local.get $odd))
            (local.set $best_len (i32.and (local.get $odd) (i32.const 0xffff)))))
        (local.set $even (call $expand (local.get $str_base) (local.get $n) (local.get $i) (i32.add (local.get $i) (i32.const 1))))
        (if (i32.gt_s (i32.and (local.get $even) (i32.const 0xffff)) (local.get $best_len))
          (then
            (local.set $best (local.get $even))
            (local.set $best_len (i32.and (local.get $even) (i32.const 0xffff)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop)))
    (local.get $best))
)
