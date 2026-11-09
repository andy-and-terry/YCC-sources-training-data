type Perm = enum pRead, pWrite, pExec

var p: set[Perm] = {pRead, pWrite}
echo pRead in p, pExec in p
p.incl pExec
p.excl pWrite
echo p
