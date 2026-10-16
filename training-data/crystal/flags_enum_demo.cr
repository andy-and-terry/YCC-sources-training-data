@[Flags]
enum Permission
  Read
  Write
  Execute
end

perm = Permission::Read | Permission::Write
puts perm
puts perm.value
puts perm.includes?(Permission::Write)
puts perm.includes?(Permission::Execute)

perm |= Permission::Execute
puts perm
perm &= ~Permission::Read
puts perm
puts Permission::All
puts Permission::None
puts Permission.parse("read, execute")
