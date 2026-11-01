class Recorder
  def initialize = @calls = []
  attr_reader :calls

  def method_missing(name, *args)
    @calls << [name, args]
    self
  end

  def respond_to_missing?(*) = true
end

r = Recorder.new
r.foo(1).bar(2, 3)
p r.calls
