class CPU:
    def freeze(self):
        print("CPU: freezing")

    def jump(self, position):
        print(f"CPU: jumping to 0x{position:02x}")

    def execute(self):
        print("CPU: executing")


class Memory:
    def load(self, position, data):
        print(f"Memory: loading '{data}' at 0x{position:02x}")


class HardDrive:
    def read(self, lba, size):
        print(f"HardDrive: reading {size} bytes from sector {lba}")
        return "boot sector data"


class ComputerFacade:
    """Hides the multi-step boot sequence behind a single simple method."""

    BOOT_ADDRESS = 0x00
    BOOT_SECTOR = 0
    SECTOR_SIZE = 512

    def __init__(self):
        self._cpu = CPU()
        self._memory = Memory()
        self._hard_drive = HardDrive()

    def start(self):
        self._cpu.freeze()
        data = self._hard_drive.read(self.BOOT_SECTOR, self.SECTOR_SIZE)
        self._memory.load(self.BOOT_ADDRESS, data)
        self._cpu.jump(self.BOOT_ADDRESS)
        self._cpu.execute()


if __name__ == "__main__":
    computer = ComputerFacade()
    computer.start()
