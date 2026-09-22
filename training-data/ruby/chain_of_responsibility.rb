class Handler
  attr_accessor :successor

  def initialize(successor = nil)
    @successor = successor
  end

  def handle(request)
    return successor&.handle(request) unless can_handle?(request)

    process(request)
  end
end

class LowSeverityHandler < Handler
  def can_handle?(request)
    request[:severity] <= 1
  end

  def process(request)
    "logged: #{request[:message]}"
  end
end

class MediumSeverityHandler < Handler
  def can_handle?(request)
    request[:severity] <= 3
  end

  def process(request)
    "emailed team: #{request[:message]}"
  end
end

class HighSeverityHandler < Handler
  def can_handle?(_request)
    true
  end

  def process(request)
    "paged on-call: #{request[:message]}"
  end
end

chain = LowSeverityHandler.new(MediumSeverityHandler.new(HighSeverityHandler.new))

puts chain.handle(severity: 1, message: "disk 80% full")
puts chain.handle(severity: 3, message: "queue backing up")
puts chain.handle(severity: 5, message: "service down")
