(module
  (type $unary (func (param i32) (result i32)))
  (table $t 1 8 funcref)

  (func $double (type $unary) (i32.mul (local.get 0) (i32.const 2)))
  (func $square (type $unary) (i32.mul (local.get 0) (local.get 0)))
  (elem declare func $double $square)

  ;; Install $double in slot 0
  (func (export "init")
    (table.set $t (i32.const 0) (ref.func $double)))

  ;; Grow by one slot, store $square there, return the new slot index
  (func (export "add_square") (result i32)
    (local $idx i32)
    (local.set $idx
      (table.grow $t (ref.func $square) (i32.const 1)))
    (local.get $idx))

  (func (export "size") (result i32)
    (table.size $t))

  (func (export "call_slot") (param $slot i32) (param $x i32) (result i32)
    (call_indirect $t (type $unary) (local.get $x) (local.get $slot)))

  ;; 1 if the slot holds null
  (func (export "is_empty") (param $slot i32) (result i32)
    (ref.is_null (table.get $t (local.get $slot))))
)
