@[Flags]
enum Perm
  Read
  Write
  Exec
end

p = Perm::Read | Perm::Exec
puts p
puts p.includes?(Perm::Write)
puts p.value
