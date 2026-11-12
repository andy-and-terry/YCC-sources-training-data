@[Flags]
enum Perm
  Read
  Write
  Exec
end
p = Perm::Read | Perm::Write
puts p, p.write?, p.exec?
