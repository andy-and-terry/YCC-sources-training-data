class Tracked; end

3.times { Tracked.new }
GC.start
puts ObjectSpace.each_object(Class).first.class
keep = Array.new(2) { Tracked.new }
puts ObjectSpace.each_object(Tracked).count >= 2
puts GC.count.class, GC.stat[:count].class, GC.stat.key?(:total_allocated_objects)

require "weakref"
ref = WeakRef.new(keep[0])
puts ref.weakref_alive?
puts keep[0].object_id == ObjectSpace._id2ref(keep[0].object_id).object_id rescue puts "id2ref removed"

ObjectSpace.define_finalizer(keep[1], proc { })
ObjectSpace.undefine_finalizer(keep[1])
puts ObjectSpace.count_objects[:TOTAL].positive?
