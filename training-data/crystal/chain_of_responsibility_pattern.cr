abstract class Handler
  property next_handler : Handler?

  def set_next(handler : Handler) : Handler
    @next_handler = handler
    handler
  end

  def handle(request : Int32)
    @next_handler.try &.handle(request)
  end
end

class LowHandler < Handler
  def handle(request : Int32)
    if request < 10
      puts "LowHandler handled #{request}"
    else
      super
    end
  end
end

class MidHandler < Handler
  def handle(request : Int32)
    if request < 100
      puts "MidHandler handled #{request}"
    else
      super
    end
  end
end

class HighHandler < Handler
  def handle(request : Int32)
    puts "HighHandler handled #{request}"
  end
end

low = LowHandler.new
mid = MidHandler.new
high = HighHandler.new
low.set_next(mid).set_next(high)

[5, 50, 500].each { |r| low.handle(r) }
