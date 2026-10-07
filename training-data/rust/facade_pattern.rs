// Facade pattern: a single, simple entry point hides a handful of
// finer-grained subsystem types the caller shouldn't have to juggle.
struct Cpu;

impl Cpu {
    fn freeze(&self) {
        println!("CPU: freezing");
    }
    fn jump(&self, position: u32) {
        println!("CPU: jumping to {:#06x}", position);
    }
    fn execute(&self) {
        println!("CPU: executing");
    }
}

struct Memory;

impl Memory {
    fn load(&self, position: u32, data: &str) {
        println!("Memory: loading '{}' at {:#06x}", data, position);
    }
}

struct HardDrive;

impl HardDrive {
    fn read(&self, sector: u32, size: u32) -> String {
        println!("HardDrive: reading {} bytes from sector {}", size, sector);
        "boot sector data".to_string()
    }
}

struct ComputerFacade {
    cpu: Cpu,
    memory: Memory,
    hard_drive: HardDrive,
}

impl ComputerFacade {
    const BOOT_ADDRESS: u32 = 0x00;
    const BOOT_SECTOR: u32 = 0;
    const SECTOR_SIZE: u32 = 512;

    fn new() -> Self {
        ComputerFacade {
            cpu: Cpu,
            memory: Memory,
            hard_drive: HardDrive,
        }
    }

    fn start(&self) {
        self.cpu.freeze();
        let data = self.hard_drive.read(Self::BOOT_SECTOR, Self::SECTOR_SIZE);
        self.memory.load(Self::BOOT_ADDRESS, &data);
        self.cpu.jump(Self::BOOT_ADDRESS);
        self.cpu.execute();
    }
}

fn main() {
    let computer = ComputerFacade::new();
    computer.start();
}
