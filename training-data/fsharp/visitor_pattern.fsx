// A Gang-of-Four Visitor needs no double dispatch here: a discriminated
// union's cases are fixed and known, so any function can pattern match over
// all of them and act as a "visitor" without touching the type definition.
type Expr =
    | Num of int
    | Add of Expr * Expr
    | Mul of Expr * Expr

let rec evaluate expr =
    match expr with
    | Num n -> n
    | Add(l, r) -> evaluate l + evaluate r
    | Mul(l, r) -> evaluate l * evaluate r

let rec render expr =
    match expr with
    | Num n -> string n
    | Add(l, r) -> sprintf "(%s + %s)" (render l) (render r)
    | Mul(l, r) -> sprintf "(%s * %s)" (render l) (render r)

let expr = Add(Num 2, Mul(Num 3, Num 4))
printfn "%s = %d" (render expr) (evaluate expr)
