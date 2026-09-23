struct PointStruct
  property x : Int32
  property y : Int32

  def initialize(@x : Int32, @y : Int32)
  end
end

class PointClass
  property x : Int32
  property y : Int32

  def initialize(@x : Int32, @y : Int32)
  end
end

def mutate_struct(point : PointStruct)
  point.x = 100
end

def mutate_class(point : PointClass)
  point.x = 100
end

s1 = PointStruct.new(1, 2)
mutate_struct(s1)
puts "struct after mutate_struct: (#{s1.x}, #{s1.y})"

s2 = PointStruct.new(1, 2)
s3 = s2
s3.x = 50
puts "struct assignment copies: s2.x=#{s2.x}, s3.x=#{s3.x}"

c1 = PointClass.new(1, 2)
mutate_class(c1)
puts "class after mutate_class: (#{c1.x}, #{c1.y})"

c2 = PointClass.new(1, 2)
c3 = c2
c3.x = 50
puts "class assignment shares reference: c2.x=#{c2.x}, c3.x=#{c3.x}"
