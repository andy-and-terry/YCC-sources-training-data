@[Flags]
enum Perm
  Read
  Write
  Exec
end

p = Perm::Read | Perm::Exec
puts p, p.includes?(Perm::Write)
