trait Command {
  def execute(): Unit
  def undo(): Unit
}

class Light {
  private var on = false
  def turnOn(): Unit = { on = true; println("light on") }
  def turnOff(): Unit = { on = false; println("light off") }
  def isOn: Boolean = on
}

class LightOnCommand(light: Light) extends Command {
  def execute(): Unit = light.turnOn()
  def undo(): Unit = light.turnOff()
}

class LightOffCommand(light: Light) extends Command {
  def execute(): Unit = light.turnOff()
  def undo(): Unit = light.turnOn()
}

class RemoteControl {
  private var history: List[Command] = List()

  def submit(command: Command): Unit = {
    command.execute()
    history = history :+ command
  }

  def undoLast(): Unit = history match {
    case Nil => println("nothing to undo")
    case _ =>
      val last = history.last
      last.undo()
      history = history.dropRight(1)
  }
}

object CommandPatternDemo {
  def main(args: Array[String]): Unit = {
    val light = new Light
    val remote = new RemoteControl

    remote.submit(new LightOnCommand(light))
    remote.submit(new LightOffCommand(light))
    remote.undoLast()
    remote.undoLast()
  }
}
