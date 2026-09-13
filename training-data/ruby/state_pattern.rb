class TrafficLight
  def initialize
    @state = :red
  end

  def next!
    @state = case @state
             when :red then :green
             when :green then :yellow
             when :yellow then :red
             end
  end

  attr_reader :state
end

light = TrafficLight.new
4.times do
  puts light.state
  light.next!
end
