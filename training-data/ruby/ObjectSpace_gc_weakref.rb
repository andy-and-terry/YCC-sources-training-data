class Temp; end
3.times { Temp.new }
GC.start
puts ObjectSpace.each_object(Class).first.is_a?(Class)
puts 12.object_id == 12.object_id, "a".object_id == "a".object_id, :a.object_id == :a.object_id
puts defined?(foo).inspect, defined?(puts), defined?(String), defined?(@x).inspect
puts __method__.inspect, __FILE__ == $0
