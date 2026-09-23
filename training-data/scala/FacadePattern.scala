class Cpu {
  def freeze(): Unit = println("CPU: freezing")
  def jump(position: Int): Unit = println(f"CPU: jumping to $position%#06x")
  def execute(): Unit = println("CPU: executing")
}

class Memory {
  def load(position: Int, data: String): Unit =
    println(f"Memory: loading '$data' at $position%#06x")
}

class HardDrive {
  def read(sector: Int, size: Int): String = {
    println(s"HardDrive: reading $size bytes from sector $sector")
    "boot sector data"
  }
}

class ComputerFacade {
  private val cpu = new Cpu
  private val memory = new Memory
  private val hardDrive = new HardDrive
  private val bootAddress = 0x00
  private val bootSector = 0
  private val sectorSize = 512

  def start(): Unit = {
    cpu.freeze()
    val data = hardDrive.read(bootSector, sectorSize)
    memory.load(bootAddress, data)
    cpu.jump(bootAddress)
    cpu.execute()
  }
}

object FacadePatternDemo {
  def main(args: Array[String]): Unit = {
    new ComputerFacade().start()
  }
}
