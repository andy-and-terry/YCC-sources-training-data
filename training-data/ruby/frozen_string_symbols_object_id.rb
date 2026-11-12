a = "x".freeze
p a.frozen?, :s.object_id == :s.object_id, "s".object_id == "s".object_id
begin; a << "y"; rescue FrozenError => e; puts e.class; end
