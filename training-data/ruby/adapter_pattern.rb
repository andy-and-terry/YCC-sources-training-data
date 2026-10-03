class EuropeanSocket
  def voltage
    230
  end
end

class USPlug
  def initialize(socket)
    @socket = socket
  end

  # Adapts the 230V European interface to the 120V US interface the
  # client code expects.
  def us_voltage
    @socket.voltage / 2
  end
end

socket = EuropeanSocket.new
plug = USPlug.new(socket)
puts "socket voltage: #{socket.voltage}"
puts "adapted voltage: #{plug.us_voltage}"
