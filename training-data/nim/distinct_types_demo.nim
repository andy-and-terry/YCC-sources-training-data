type
  UserId = distinct int
  ProductId = distinct int

proc `$`(id: UserId): string = "User#" & $int(id)
proc `$`(id: ProductId): string = "Product#" & $int(id)

proc `==`(a, b: UserId): bool {.borrow.}

let u1 = UserId(42)
let u2 = UserId(42)
let p1 = ProductId(42)

echo u1
echo p1
echo u1 == u2
# The following would be a compile error even though the underlying
# representation is identical: distinct types are not interchangeable.
# echo u1 == p1
