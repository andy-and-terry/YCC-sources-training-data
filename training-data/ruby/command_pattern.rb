class Light
  def on
    puts "light on"
  end

  def off
    puts "light off"
  end
end

class Command
  def execute
    raise NotImplementedError
  end

  def undo
    raise NotImplementedError
  end
end

class LightOnCommand < Command
  def initialize(light)
    @light = light
  end

  def execute
    @light.on
  end

  def undo
    @light.off
  end
end

class LightOffCommand < Command
  def initialize(light)
    @light = light
  end

  def execute
    @light.off
  end

  def undo
    @light.on
  end
end

class RemoteControl
  def initialize
    @history = []
  end

  def submit(command)
    command.execute
    @history << command
  end

  def undo_last
    return if @history.empty?

    @history.pop.undo
  end
end

light = Light.new
remote = RemoteControl.new
remote.submit(LightOnCommand.new(light))
remote.submit(LightOffCommand.new(light))
remote.undo_last
