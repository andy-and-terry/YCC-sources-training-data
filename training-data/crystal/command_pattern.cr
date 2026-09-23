abstract class Command
  abstract def execute : Nil
  abstract def undo : Nil
end

class Light
  property on : Bool = false

  def turn_on : Nil
    @on = true
    puts "light on"
  end

  def turn_off : Nil
    @on = false
    puts "light off"
  end
end

class TurnOnCommand < Command
  def initialize(@light : Light)
  end

  def execute : Nil
    @light.turn_on
  end

  def undo : Nil
    @light.turn_off
  end
end

class TurnOffCommand < Command
  def initialize(@light : Light)
  end

  def execute : Nil
    @light.turn_off
  end

  def undo : Nil
    @light.turn_on
  end
end

class RemoteControl
  def initialize
    @history = [] of Command
  end

  def submit(command : Command) : Nil
    command.execute
    @history << command
  end

  def undo_last : Nil
    return if @history.empty?
    @history.pop.undo
  end
end

light = Light.new
remote = RemoteControl.new
remote.submit(TurnOnCommand.new(light))
remote.submit(TurnOffCommand.new(light))
remote.undo_last
