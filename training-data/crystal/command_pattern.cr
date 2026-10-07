abstract class Command
  abstract def execute
  abstract def undo
end

class Light
  property on : Bool = false

  def turn_on
    @on = true
    puts "Light on"
  end

  def turn_off
    @on = false
    puts "Light off"
  end
end

class LightOnCommand < Command
  def initialize(@light : Light)
  end

  def execute
    @light.turn_on
  end

  def undo
    @light.turn_off
  end
end

class RemoteControl
  def initialize
    @history = [] of Command
  end

  def submit(command : Command)
    command.execute
    @history << command
  end

  def undo_last
    @history.pop?.try(&.undo)
  end
end

light = Light.new
remote = RemoteControl.new
remote.submit(LightOnCommand.new(light))
remote.undo_last
