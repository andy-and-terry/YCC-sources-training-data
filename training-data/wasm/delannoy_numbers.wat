(module
  (memory (export "memory") 1)

  ;; Byte address of cell (m, n) in a row-major table with 10 columns.
  (func $addr (param $m i32) (param $n i32) (result i32)
    (i32.shl
      (i32.add (i32.mul (local.get $m) (i32.const 10)) (local.get $n))
      (i32.const 2)))

  ;; Fills the table at address 0 for sizes up to 10; D(k,k) is the central number.
  (func $delannoy (export "delannoy") (param $size i32)
    (local $m i32) (local $n i32)
    (block $m_done
      (loop $m_loop
        (br_if $m_done (i32.ge_s (local.get $m) (local.get $size)))
        (local.set $n (i32.const 0))
        (block $n_done
          (loop $n_loop
            (br_if $n_done (i32.ge_s (local.get $n) (local.get $size)))
            (i32.store (call $addr (local.get $m) (local.get $n))
              (if (result i32)
                  (i32.or (i32.eqz (local.get $m)) (i32.eqz (local.get $n)))
                (then (i32.const 1))
                (else
                  (i32.add
                    (i32.add
                      (i32.load (call $addr (i32.sub (local.get $m) (i32.const 1)) (local.get $n)))
                      (i32.load (call $addr (local.get $m) (i32.sub (local.get $n) (i32.const 1)))))
                    (i32.load (call $addr (i32.sub (local.get $m) (i32.const 1))
                                          (i32.sub (local.get $n) (i32.const 1))))))))
            (local.set $n (i32.add (local.get $n) (i32.const 1)))
            (br $n_loop)))
        (local.set $m (i32.add (local.get $m) (i32.const 1)))
        (br $m_loop))))
)
