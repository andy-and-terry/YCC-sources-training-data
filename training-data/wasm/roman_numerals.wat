(module
  (memory (export "memory") 1)

  ;; Value table: 13 i32 values, highest to lowest, including the
  ;; subtractive forms (900, 400, 90, 40, 9, 4).
  (data (i32.const 1000)
    "\e8\03\00\00\84\03\00\00\f4\01\00\00\90\01\00\00\64\00\00\00\5a\00\00\00"
    "\32\00\00\00\28\00\00\00\0a\00\00\00\09\00\00\00\05\00\00\00\04\00\00\00\01\00\00\00")

  ;; Matching symbol table: 2 ASCII bytes per entry (a trailing 0x00
  ;; byte marks a single-letter symbol: "M", "D", "C", "L", "X", "V", "I").
  (data (i32.const 2000) "M\00CMD\00CDC\00XCL\00XLX\00IXV\00IVI\00")

  (func $append (param $out_base i32) (param $len i32) (param $ch i32) (result i32)
    (i32.store8 (i32.add (local.get $out_base) (local.get $len)) (local.get $ch))
    (i32.add (local.get $len) (i32.const 1)))

  ;; Converts an integer (1..3999) to a Roman numeral string written
  ;; at out_base, returning its length. Walks the value table
  ;; highest-to-lowest, repeatedly subtracting and emitting the
  ;; matching symbol while the value still fits.
  (func $int_to_roman (export "int_to_roman") (param $n i32) (param $out_base i32) (result i32)
    (local $remaining i32)
    (local $len i32)
    (local $idx i32)
    (local $value i32)
    (local $sym_addr i32)
    (local $second_byte i32)
    (local.set $remaining (local.get $n))
    (local.set $len (i32.const 0))
    (local.set $idx (i32.const 0))
    (block $outer_done
      (loop $outer
        (br_if $outer_done (i32.ge_s (local.get $idx) (i32.const 13)))
        (local.set $value (i32.load (i32.add (i32.const 1000) (i32.mul (local.get $idx) (i32.const 4)))))
        (local.set $sym_addr (i32.add (i32.const 2000) (i32.mul (local.get $idx) (i32.const 2))))
        (block $inner_done
          (loop $inner
            (br_if $inner_done (i32.lt_s (local.get $remaining) (local.get $value)))
            (local.set $len (call $append (local.get $out_base) (local.get $len) (i32.load8_u (local.get $sym_addr))))
            (local.set $second_byte (i32.load8_u (i32.add (local.get $sym_addr) (i32.const 1))))
            (if (i32.ne (local.get $second_byte) (i32.const 0))
              (then (local.set $len (call $append (local.get $out_base) (local.get $len) (local.get $second_byte)))))
            (local.set $remaining (i32.sub (local.get $remaining) (local.get $value)))
            (br $inner)))
        (local.set $idx (i32.add (local.get $idx) (i32.const 1)))
        (br $outer)))
    (local.get $len))
)
