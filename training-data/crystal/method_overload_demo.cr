class Printer
  def show(x : Int32)
    puts "Int32: #{x}"
  end

  def show(x : String)
    puts "String: #{x.inspect}"
  end

  def show(x : Array(T)) forall T
    puts "Array of #{T}: #{x.size} items"
  end

  def show(x : Nil)
    puts "nothing"
  end

  def show(x, y)
    puts "two args: #{x}, #{y}"
  end
end

p = Printer.new
p.show(42)
p.show("hi")
p.show([1.5, 2.5])
p.show(nil)
p.show(:a, :b)
