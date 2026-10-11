type
  Perm = enum
    permRead, permWrite, permExec

var p: set[Perm] = {permRead}
p.incl permWrite
echo p
echo permExec in p
p.excl permRead
echo p, " ", card(p)
let all = {Perm.low .. Perm.high}
echo all - p
echo p <= all
