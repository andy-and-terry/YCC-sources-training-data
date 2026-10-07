class CPU {
  def freeze(): String = "CPU: freeze"
  def jump(position: Int): String = s"CPU: jump to $position"
  def execute(): String = "CPU: execute"
}

class Memory {
  def load(position: Int, data: String): String = s"Memory: load '$data' at $position"
}

class HardDrive {
  def read(sector: Int, size: Int): String = s"HardDrive: read $size bytes from sector $sector"
}

class ComputerFacade {
  private val cpu = new CPU
  private val memory = new Memory
  private val hardDrive = new HardDrive

  def start(): List[String] = {
    val bootData = hardDrive.read(0, 1024)
    List(
      cpu.freeze(),
      bootData,
      memory.load(0, "boot sector"),
      cpu.jump(0),
      cpu.execute()
    )
  }
}

object FacadePattern {
  def main(args: Array[String]): Unit = {
    new ComputerFacade().start().foreach(println)
  }
}
