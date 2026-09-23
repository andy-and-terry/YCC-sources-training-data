class CpuSubsystem {
  freeze(): void {
    console.log("CPU: freeze");
  }
  execute(): void {
    console.log("CPU: execute");
  }
}

class MemorySubsystem {
  load(position: number, data: string): void {
    console.log(`Memory: load "${data}" at ${position}`);
  }
}

class HardDriveSubsystem {
  read(lba: number, size: number): string {
    console.log(`HardDrive: read ${size} bytes at sector ${lba}`);
    return "boot-sector-data";
  }
}

class ComputerFacade {
  private cpu = new CpuSubsystem();
  private memory = new MemorySubsystem();
  private hardDrive = new HardDriveSubsystem();

  start(): void {
    this.cpu.freeze();
    const bootData = this.hardDrive.read(0, 512);
    this.memory.load(0, bootData);
    this.cpu.execute();
  }
}

const computer = new ComputerFacade();
computer.start();
