class Recorder
  def initialize
    @calls = []
  end

  def method_missing(name, *args)
    @calls << [name, args]
    self
  end

  def respond_to_missing?(*) = true

  attr_reader :calls
end

r = Recorder.new.open("file").write("x").close
p r.calls
