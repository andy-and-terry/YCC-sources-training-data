class DynamicProxy
  def initialize(target)
    @target = target
  end

  def method_missing(name, *args, &block)
    if @target.respond_to?(name)
      puts "calling #{name}"
      @target.send(name, *args, &block)
    else
      super
    end
  end

  def respond_to_missing?(name, include_private = false)
    @target.respond_to?(name) || super
  end
end

proxy = DynamicProxy.new([1, 2, 3])
puts proxy.sum
puts proxy.respond_to?(:sum)
