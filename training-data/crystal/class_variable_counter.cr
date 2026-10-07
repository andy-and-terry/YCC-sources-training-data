class Widget
  @@count = 0
  @@registry = [] of String

  getter name : String

  def initialize(@name : String)
    @@count += 1
    @@registry << @name
  end

  def self.count : Int32
    @@count
  end

  def self.names : Array(String)
    @@registry
  end
end

Widget.new("gear")
Widget.new("lever")
Widget.new("spring")
puts Widget.count
puts Widget.names.join(", ")
