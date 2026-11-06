;; Number of Roman numeral symbols needed for n, using a greedy table in memory
(module
  (memory 1)
  ;; values (i32 each) at offset 0, symbol lengths (bytes) at offset 64
  (data (i32.const 0)
    "\e8\03\00\00" "\84\03\00\00" "\f4\01\00\00" "\90\01\00\00" "\64\00\00\00"
    "\5a\00\00\00" "\32\00\00\00" "\28\00\00\00" "\0a\00\00\00" "\09\00\00\00"
    "\05\00\00\00" "\04\00\00\00" "\01\00\00\00")
  (data (i32.const 64) "\01\02\01\02\01\02\01\02\01\02\01\02\01")

  (func (export "roman_length") (param $n i32) (result i32)
    (local $i i32) (local $v i32) (local $len i32)
    (block $done
      (loop $entries
        (br_if $done (i32.ge_u (local.get $i) (i32.const 13)))
        (local.set $v (i32.load (i32.mul (local.get $i) (i32.const 4))))
        (block $exit
          (loop $repeat
            (br_if $exit (i32.lt_u (local.get $n) (local.get $v)))
            (local.set $n (i32.sub (local.get $n) (local.get $v)))
            (local.set $len
              (i32.add (local.get $len)
                       (i32.load8_u (i32.add (i32.const 64) (local.get $i)))))
            (br $repeat)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $entries)))
    (local.get $len)))
