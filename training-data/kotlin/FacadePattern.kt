class CpuSubsystem {
    fun freeze() = println("CPU: freeze")
    fun jump(position: Long) = println("CPU: jump to $position")
    fun execute() = println("CPU: execute")
}

class MemorySubsystem {
    fun load(position: Long, data: String) = println("Memory: load '$data' at $position")
}

class HardDriveSubsystem {
    fun read(lba: Long, size: Int): String = "boot-sector-data"
}

class ComputerFacade {
    private val cpu = CpuSubsystem()
    private val memory = MemorySubsystem()
    private val hardDrive = HardDriveSubsystem()

    fun start() {
        cpu.freeze()
        val bootData = hardDrive.read(0, 512)
        memory.load(0, bootData)
        cpu.jump(0)
        cpu.execute()
    }
}

fun main() {
    val computer = ComputerFacade()
    computer.start()
}
