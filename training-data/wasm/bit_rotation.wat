(module
  (func (export "rotl") (param $x i32) (param $n i32) (result i32)
    (i32.rotl (local.get $x) (local.get $n)))

  (func (export "rotr") (param $x i32) (param $n i32) (result i32)
    (i32.rotr (local.get $x) (local.get $n)))

  ;; Reverse the bit order of a 32-bit value
  (func (export "bit_reverse") (param $x i32) (result i32)
    (local $r i32)
    (local $i i32)
    (block $done
      (loop $next
        (br_if $done (i32.eq (local.get $i) (i32.const 32)))
        (local.set $r
          (i32.or
            (i32.shl (local.get $r) (i32.const 1))
            (i32.and (local.get $x) (i32.const 1))))
        (local.set $x (i32.shr_u (local.get $x) (i32.const 1)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (local.get $r))
)
