type
  Permission = enum
    pRead, pWrite, pExecute

  Permissions = set[Permission]

proc describe(p: Permissions): string =
  result = ""
  if pRead in p: result.add("r") else: result.add("-")
  if pWrite in p: result.add("w") else: result.add("-")
  if pExecute in p: result.add("x") else: result.add("-")

var perms: Permissions = {pRead, pWrite}
echo describe(perms)

perms.incl(pExecute)
echo describe(perms)

perms.excl(pWrite)
echo describe(perms)

let combined = {pRead, pWrite} + {pExecute}
echo describe(combined)
echo pRead in combined
