(module
  (memory (export "mem") 1)

  ;; Add two i32x4 vectors stored at the given addresses, write result to out
  (func (export "add4") (param $a i32) (param $b i32) (param $out i32)
    (v128.store (local.get $out)
      (i32x4.add
        (v128.load (local.get $a))
        (v128.load (local.get $b)))))

  ;; Sum all four lanes of the vector at $addr
  (func (export "sum_lanes") (param $addr i32) (result i32)
    (local $v v128)
    (local.set $v (v128.load (local.get $addr)))
    (i32.add
      (i32.add
        (i32x4.extract_lane 0 (local.get $v))
        (i32x4.extract_lane 1 (local.get $v)))
      (i32.add
        (i32x4.extract_lane 2 (local.get $v))
        (i32x4.extract_lane 3 (local.get $v)))))

  ;; Broadcast a scalar into all lanes and multiply a vector by it
  (func (export "scale4") (param $addr i32) (param $k i32)
    (v128.store (local.get $addr)
      (i32x4.mul
        (v128.load (local.get $addr))
        (i32x4.splat (local.get $k)))))
)
