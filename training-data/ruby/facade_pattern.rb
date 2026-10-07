class CPU
  def freeze_processor
    puts 'CPU: freezing'
  end

  def jump(position)
    puts "CPU: jumping to #{format('0x%04X', position)}"
  end

  def execute
    puts 'CPU: executing'
  end
end

class Memory
  def load(position, data)
    puts "Memory: loading '#{data}' at #{format('0x%04X', position)}"
  end
end

class HardDrive
  def read(sector, size)
    puts "HardDrive: reading #{size} bytes from sector #{sector}"
    'boot sector data'
  end
end

class ComputerFacade
  BOOT_ADDRESS = 0x00
  BOOT_SECTOR = 0
  SECTOR_SIZE = 512

  def initialize
    @cpu = CPU.new
    @memory = Memory.new
    @hard_drive = HardDrive.new
  end

  def start
    @cpu.freeze_processor
    data = @hard_drive.read(BOOT_SECTOR, SECTOR_SIZE)
    @memory.load(BOOT_ADDRESS, data)
    @cpu.jump(BOOT_ADDRESS)
    @cpu.execute
  end
end

ComputerFacade.new.start
