import macros

macro unless(cond: bool, body: untyped): untyped =
  ## Compile-time macro implementing the opposite of `if`: the body
  ## runs only when `cond` is false. `quote do` builds the expanded
  ## AST from ordinary Nim syntax, splicing in the captured nodes.
  result = quote do:
    if not `cond`:
      `body`

let x = 5
unless x > 10:
  echo "x is not greater than 10"

unless x > 3:
  echo "this should not print, since x > 3 is true"
