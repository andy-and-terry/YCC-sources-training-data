import std/macros

macro debugPrint(exprs: varargs[untyped]): untyped =
  result = newStmtList()
  for e in exprs:
    let label = e.toStrLit
    result.add quote do:
      echo `label`, " = ", `e`

macro genGetterSetter(typ: untyped, field: untyped): untyped =
  let fieldName = $field
  let getterName = ident("get" & fieldName)
  let setterName = ident("set" & fieldName)
  result = quote do:
    proc `getterName`(obj: `typ`): auto = obj.`field`
    proc `setterName`(obj: var `typ`, value: typeof(obj.`field`)) =
      obj.`field` = value

type
  Counter = object
    value: int

genGetterSetter(Counter, value)

var c = Counter(value: 0)
setvalue(c, 10)
let x = 5
let y = x * 2
debugPrint(x, y, getvalue(c))
