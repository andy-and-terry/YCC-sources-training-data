class CpuSubsystem {
  freeze(): void {
    console.log('cpu: freeze');
  }

  jump(position: number): void {
    console.log(`cpu: jump to ${position}`);
  }

  execute(): void {
    console.log('cpu: execute');
  }
}

class MemorySubsystem {
  load(position: number, data: string): void {
    console.log(`memory: load "${data}" at ${position}`);
  }
}

class HardDriveSubsystem {
  read(sector: number, size: number): string {
    console.log(`disk: read ${size} bytes from sector ${sector}`);
    return 'boot-data';
  }
}

class ComputerFacade {
  private cpu = new CpuSubsystem();
  private memory = new MemorySubsystem();
  private disk = new HardDriveSubsystem();

  start(): void {
    this.cpu.freeze();
    const data = this.disk.read(0, 1024);
    this.memory.load(0, data);
    this.cpu.jump(0);
    this.cpu.execute();
  }
}

const computer = new ComputerFacade();
computer.start();
