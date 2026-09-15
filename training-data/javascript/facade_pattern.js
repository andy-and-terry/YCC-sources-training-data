class CPU {
  start() {
    console.log('CPU: starting');
  }
}
class Memory {
  load() {
    console.log('Memory: loading');
  }
}
class Disk {
  read() {
    console.log('Disk: reading boot sector');
  }
}

class ComputerFacade {
  constructor() {
    this.cpu = new CPU();
    this.memory = new Memory();
    this.disk = new Disk();
  }
  start() {
    this.cpu.start();
    this.memory.load();
    this.disk.read();
    console.log('Computer: ready');
  }
}

const computer = new ComputerFacade();
computer.start();
module.exports = { ComputerFacade };
